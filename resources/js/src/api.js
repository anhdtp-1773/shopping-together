import superagent from "superagent";

export default {
    saveSetting(data){
        return superagent.post('/api/setting/save').send({
            'shopify_domain': domain,
            'title_font_family': data.titleFontFamily,
            'title_font_style': data.titleFontStyle,
            'title_font_size': data.titleFontSize,
            'title_font_color': data.titleFontColor,
            'product_font_family': data.productFontFamily,
            'product_font_style': data.productFontStyle,
            'product_font_size': data.productFontSize,
            'product_font_color': data.productFontColor,
        });
    },
    getSetup(){
        return superagent.post('/api/setting/get').send({
            'shopify_domain': domain,
        });
    },
    getProductInfo(){
        return superagent.post('/api/product/get').send({
            'shopify_domain': domain,
        });
    },
}