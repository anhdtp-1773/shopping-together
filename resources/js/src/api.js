import superagent from "superagent";

export default {
    getProductInfo(){
        return superagent.post('/api/product/get').send({
            'shopify_domain': domain,
        });
    },
}