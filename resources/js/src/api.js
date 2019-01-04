import superagent from "superagent";

export default {
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