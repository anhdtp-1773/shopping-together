import superagent from "superagent";

export default {
    saveSetting(data){
        console.log(data)
        return superagent.post('/api/app/setting/save').send({
            'shopify_domain': domain,
            'title_font_family': data.titleFontFamily,
            'title_font_style': data.titleFontStyle,
            'title_font_size': data.titleFontSize,
            'title_font_color': data.titleFontColor,
        });
    },
    getSetup(){
        return superagent.post('/api/app/setting/get').send({
            'shopify_domain': domain,
        });
    },
}