const domain = window.location.host;
var dir = '';
var isProductPage = window.ShopifyAnalytics.meta.page.pageType === 'product';
var currency = window.ShopifyAnalytics.meta.currency;
dir = document.querySelector('script[src*="shopping.js"]').getAttribute('src')
dir = dir.replace('/' + dir.split('/').pop(), '');
url = dir.replace("public/js", '');
$('head').append('<link rel="stylesheet" type="text/css" href="https://18acf9b0.ngrok.io/public/css/sptapp.css" />');
// $('head').append('<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.12/handlebars.amd.min.js" type="text/javascript"></script>');
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

window.cartRules = [];
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
            window.cartRules = cartRule.data
            renderCartRule(settings, cartRule)
        },
    });
}

function renderCartRule (settings, cartRule) {
    $("form[action='/cart/add']").after("<div class='cart-rule'></div>");
    cartRule.data.forEach(function(product, key) {
        let optionVariants = ''
        product.variants.forEach(function(variant){
            optionVariants += "<option  value='"+variant.id_variant+"'>"+variant.title+"</option>";
        });
        let newPrice =  parseFloat(product.variants[0].price);
        if(parseFloat(product.reduction_amount) > 0){
            newPrice = parseFloat(product.variants[0].price) - parseFloat(product.reduction_amount);
        }
        if(parseFloat(product.reduction_percent) > 0){
            newPrice = parseFloat(product.variants[0].price) - (parseFloat(product.reduction_amount)*parseFloat(product.reduction_percent))/100;
        }
        var checked = product.is_main_product == 1 ? 'checked' : '';
        var html= 
        "<div class='related-products'>"
            +"<input class='left' type='checkbox' name='vehicle1' value="+key+" "+checked+">"
            +"<img id='variant-img-"+key+"' class='left variant-img' src="+product.variants[0].src+" alt='Smiley face' width='90' height='90'>"
            +"<span class='left'>hello</span>"
            +"<select id='select-id-"+key+"' data-id="+key+"  class='left product-variant' onChange='onChangeSelect("+key+")'>"
                + optionVariants   
            +"</select>"
            +"<input type='text' class='left product-qty' name='vehicle1' value='1' >"
            +"<span id='old-price-"+key+"' class='left'><del>"+product.variants[0].price+currency+"</del></span>"
            +"<span id='new-price-"+key+"' class='left'>"+newPrice +currency+"</span>"
        +"</div>"
        $(".cart-rule").append(html);
    });
    $(".cart-rule").after("<input id='submit' type='submit' name='vehicle1' value='submit' >")

    $('#submit').click(function() {
        var tr = $(".cart-rule").find('.combination');
        var combinations = [];          
        tr.each(function() {
            let obj = {};
            $(this).find('input').each (function() {
                obj['qty'] = $(this).attr('value');
            });             
            combinations.push(obj);
        });
        console.log(combinations)
    });
}

function onChangeSelect(key) {
    let cartRule = cartRules[key];
    var idVariant = document.getElementById("select-id-"+key+"").value;
    var variant = cartRule.variants.find(x => x.id_variant === idVariant);
    $("#variant-img-"+key+"").attr('src', variant.src);
    let newPrice =  parseFloat(variant.price);
    if(parseFloat(cartRule.reduction_amount) > 0){
        newPrice = parseFloat(variant.price) - parseFloat(cartRule.reduction_amount);
    }
    if(parseFloat(cartRule.reduction_percent) > 0){
        newPrice = parseFloat(variant.price) - (parseFloat(cartRule.reduction_amount)*parseFloat(cartRule.reduction_percent))/100;
    }
    $("#old-price-"+key+"").html("<del>"+variant.price+"</del>");
    $("#new-price-"+key+"").html(newPrice);
    
}

function submit(products) {
    var data = {
        'id': 19558430867520, 
        'quantity': 1,
        properties: {
            '_bold_shopping_together_title': "Hello"
        }
    }
    $.ajax({
        type: "POST",
        url: "https://sptapp.myshopify.com/cart/add.js",
        dataType: 'json',
        data: data,
        success: function(result){
            console.log(result);
            // window.location.replace('/cart');
        },
        error: function (error) {
            console.log(error);
        }
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
