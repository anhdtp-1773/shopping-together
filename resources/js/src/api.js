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
}