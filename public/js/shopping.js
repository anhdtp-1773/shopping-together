const domain = window.location.host;
var dir = '';
var isProductPage = window.ShopifyAnalytics.meta.page.pageType === 'product';

dir = document.querySelector('script[src*="shopping.js"]').getAttribute('src')
dir = dir.replace('/' + dir.split('/').pop(), '');
url = dir.replace("public/js", '');

$('head').append('<link rel="stylesheet" type="text/css" href="https://f2c70551.ngrok.io/public/css/sptapp.css" />');
if(isProductPage){
    Shopping = new Object({});
    Shopping.getSettings = function() {
        return $.ajax({
            url: url+"api/setting/get",
            dataType: 'json', 
            type : 'POST',
            data: { 'shopify_domain' : domain },
            success:function(json){
                return json;
            },
        });
    };

    var settings = Shopping.getSettings(); 
    $.when(settings).done(function(settings){
        getCartRule(settings)
    });
}

function getCartRule (settings) {
    var productId = window.ShopifyAnalytics.meta.product.id;
    var variantId = '';
    if(getUrlParameter('variant') !== undefined && getUrlParameter('variant').length){
        variantId = getUrlParameter('variant') 
    }else{
        variantId = window.ShopifyAnalytics.meta.product.variants[0].id
    } 
    var data = {
        'variantId':variantId, 
        'id_product':productId,
        'shopify_domain': domain,
    }
    $.ajax({
        type: "POST",
        url: url+"api/cart-rule/get",
        data: data,
        success: function(cartRule){
            renderCartRule(settings, cartRule)
        },
    });
}
function renderCartRule (settings, cartRule = null) {
    $("form[action='/cart/add']").after("<div class='cart-rule'></div>");
    var array1 = ['a', 'b', 'c'];
    array1.forEach(function(product) {
        var html2= 
        "<div>"
            +"<input class='left' type='checkbox' name='vehicle1' value='Bike'>"
            +"<img class='left' src='https://cdn.shopify.com/s/files/1/0148/5150/6240/products/product-image-866574407.jpg?v=1545969439' alt='Smiley face' width='90' height='90'>"
            +"<span class='left'>hello</span>"
            +"<span class='left'>12</span>"
            +"<span class='left'>12</span>"
            +"<input type='text' class='left' name='vehicle1' value='Bike' width='50px'>"
            +"<select class='left'>"
                +"<option value='1'>Nam</option>"
                +"<option value='2'>Thao</option>"
            +"</select>"
        +"</div>"
        $(".cart-rule").append(html2);
    });
}

var getUrlParameter = function(param) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;
    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === param) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}
