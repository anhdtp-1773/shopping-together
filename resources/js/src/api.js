import superagent from "superagent";

export default {
<<<<<<< HEAD
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
=======
    getProducts(pageNumber){
        return superagent.post('/api/product/get-list').send({
            'page_number': pageNumber,
        });
    },

    searchProduct(keyWord, pageNumber){
        return superagent.post('/api/product/search').send({
            'key_word': keyWord,
            'page_number': pageNumber
        });
    },
    
>>>>>>> 60bffd4dfe35d3ef46b8886ff7519ffd64104c1b
    getProductInfo(){
        return superagent.post('/api/product/get').send({
            'shopify_domain': domain,
        });
    },

    saveCartRule(data){
        return superagent.post('/api/cart-rule/save').send({
            'shopify_domain': domain,
            'name': data.ruleName,
            'main_product': data.mainProduct,
            'related_products': data.relatedProducts
        });
    }
}