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
    
    getProductInfo(){
        return superagent.post('/api/product/get').send({
            'shopify_domain': domain,
        });
    },
}