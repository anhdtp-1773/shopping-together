import superagent from "superagent";

export default {
    getProducts(page_number){
        return superagent.post('/api/product/get-list').send({
            'page_number': page_number,
        });
    },

    searchProduct(keyWord){
        return superagent.post('/api/product/search').send({
            'key_word': keyWord,
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