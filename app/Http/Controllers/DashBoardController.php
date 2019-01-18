<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Setting;
use App\Shop;
use DB;

class DashBoardController extends Controller
{   
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getData (Request $request) 
    {
        $status = true;
        $msg = 'successfully';
        $data = array();
        $granularity = $request->granularity;
        $date_from = $request->date_from;
        $date_to = $request->date_to;
        $summary_details = $this->getSummaryDetails($date_from, $date_to, $granularity);
        
        $data = array(
            'views' => $summary_details['views'],
            'orders' => $summary_details['orders'],
            'revenues' => $summary_details['revenues'],
        );
        return response()->json([
            'data' => $data,
            'message' => $msg,
            'status' => $status,
        ], 200); 
    }

    
    /**
     * @param $date_from
     * @param $date_to
     * @param $granularity
     * @return array
     */
    public function getSummaryDetails($date_from, $date_to, $granularity)
    {
        $summary_details = array(
            'views' => array(),
            'orders' => array(),
            'revenues' => array(),
        );
        $stats = self::getStast($date_from, $date_to, $granularity);
        $from = strtotime($date_from.' 00:00:00');
        $to = min(time(), strtotime($date_to.' 23:59:59'));
        switch ($granularity) {
            case 'day':
                for ($date = $from; $date <= $to; $date = strtotime('+1 day', $date)) {
                    $summary_details['views'][$date] = isset($stats[$date]['view']) ? $stats[$date]['view'] : 0;
                    $summary_details['orders'][$date] = isset($stats[$date]['order']) ? $stats[$date]['order'] : 0;
                    $summary_details['revenues'][$date] = isset($stats[$date]['sale']) ? $stats[$date]['sale'] : 0;
                }
                break;
            case 'week':
                for ($date = $from; $date <= $to; $date = strtotime('+1 week', $date)) {
                    $summary_details['views'][$date] = isset($stats[$date]['view']) ? $stats[$date]['view'] : 0;
                    $summary_details['orders'][$date] = isset($stats[$date]['order']) ? $stats[$date]['order'] : 0;
                    $summary_details['revenues'][$date] = isset($stats[$date]['sale']) ? $stats[$date]['sale'] : 0;
                }
                break;
            default:      
                for ($date = $from; $date <= $to; $date = strtotime('+1 month', $date)) {
                    $summary_details['views'][$date] = isset($stats[$date]['view']) ? $stats[$date]['view'] : 0;
                    $summary_details['orders'][$date] = isset($stats[$date]['order']) ? $stats[$date]['order'] : 0;
                    $summary_details['revenues'][$date] = isset($stats[$date]['sale']) ? $stats[$date]['sale'] : 0;
                }
                break;
        }
        return $summary_details;
    }

    /**
     * @param $date_from
     * @param $date_to
     * @param $granularity
     * @return array
     */
    public function getStast($date_from, $date_to, $granularity)
    {
        $stats = array();
        $sql = DB::table('stats');
        $sql->selectRaw('SUM(nb_view) as total_view');
        $sql->selectRaw('SUM(nb_order) as total_order');
        $sql->selectRaw('SUM(nb_sale) as total_sale');
        $sql->selectRaw('LEFT(created_at, 10) as date');
        $sql->whereBetween('created_at',["$date_from 00:00:00", "$date_to 23:59:59"]);
        switch ($granularity) {
            case 'day':
                $sql->groupBy(DB::raw('LEFT(`created_at`, 10)'));
                break;
            case 'week':
                $sql->groupBy(DB::raw('WEEK(`created_at`, 1)'));
                break;
            default:
                $sql->groupBy(DB::raw('MONTH(`created_at`)'));
                break;
        }
        
        $results = $sql->get()->toArray();
        foreach ($results as $result) {
            switch ($granularity) {
                case 'day':
                    $stats[strtotime($result->date)]['view'] = (float) $result->total_view;
                    $stats[strtotime($result->date)]['order'] = (float) $result->total_order;
                    $stats[strtotime($result->date)]['sale'] = (float) $result->total_sale;
                    break;
                case 'week':
                    $date = strtotime(date('Y-m-d', strtotime('monday this week', strtotime($result->date))));
                    // if (!isset($stats[$date])) {
                    //     $stats[$date] = 0;
                    // }
                    $stats[$date]['view'] = (int) $result->total_view;
                    $stats[$date]['order'] = (int) $result->total_order;
                    $stats[$date]['sale'] = (float) $result->total_sale;
                    break;
                default:
                    $date = strtotime(date('Y-m', strtotime($result->date)));
                    // if (!isset($stats[$date])) {
                    //     $stats[$date] = 0;
                    // }
                    $stats[$date]['view'] = (int) $result->total_view;
                    $stats[$date]['order'] = (int) $result->total_order;
                    $stats[$date]['sale'] = (float) $result->total_sale;
                    break;
            }
        }
        return $stats;
    }
}
