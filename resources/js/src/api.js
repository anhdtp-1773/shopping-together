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
            'amount_font_family': data.amountFontFamily,
            'amount_font_style': data.amountFontStyle,
            'amount_font_size': data.amountFontSize,
            'amount_font_color': data.amountFontColor,
            'new_price_font_family': data.newPriceFontFamily,
            'new_price_font_style': data.newPriceFontStyle,
            'new_price_font_size': data.newPriceFontSize,
            'new_price_font_color': data.newPriceFontColor,
            'old_price_font_family': data.oldPriceFontFamily,
            'old_price_font_style': data.oldPriceFontStyle,
            'old_price_font_size': data.oldPriceFontSize,
            'old_price_font_color': data.oldPriceFontColor,
            'show_product_qty': data.showProductQty,
            'product_image_width': data.productImageWidth,
            'product_imgae_height': data.productImageHeight,
        });
    },
    
    getSetup(){
        return superagent.post('/api/setting/get').send({
            'shopify_domain': domain,
        });
    },
    
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