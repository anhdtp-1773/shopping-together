const domain = window.location.host;
var dir = '';
var isProductPage = window.ShopifyAnalytics.meta.page.pageType === 'product';
var currency = window.ShopifyAnalytics.meta.currency;
dir = document.querySelector('script[src*="shopping.js"]').getAttribute('src')
dir = dir.replace('/' + dir.split('/').pop(), '');
url = dir.replace("public/js", '');
$('head').append('<link rel="stylesheet" type="text/css" href="https://shoppingtogether.hamsa.site/public/css/sptapp.css" />');
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
            if((cartRule.data.length > 0)){
                window.cartRules = cartRule.data
                renderCartRule(settings, cartRule)
            }   
        },
    });
}

function renderCartRule (settings, cartRule) {
    var setting = settings.data.setting;
    $("form[action='/cart/add']").after("<div class='cart-rule'></div>");
    $(".cart-rule").append("<h3 class='spt-title'>"+setting.product_text+"</h3>")
    let total = 0;
    cartRule.data.forEach(function(product, key) {
        let optionVariants = ''
        product.variants.forEach(function(variant){
            optionVariants += "<option  value='"+variant.id_variant+"'>"+variant.title+"</option>";
        });
        let newPrice =  parseFloat(product.variants[0].price);
        if(product.is_main_product != 1){
            newPrice = parseFloat(product.variants[0].price) - (parseFloat(product.variants[0].price)*parseFloat(product.reduction_percent))/100;
            total += parseFloat(product.variants[0].price) - (parseFloat(product.variants[0].price)*parseFloat(product.reduction_percent))/100;
        }else{
            total += parseFloat(product.variants[0].price);
        }
        var html= 
        "<div class='related-products'>"
            +"<a href='https://"+domain+"/products/"+(product.variants[0].handle)+"' target='_blank'>"
                +"<img id='variant-img-"+key+"' class='left variant-img' src="+product.variants[0].src+" alt='Smiley face' width='90' height='90'>"
            +"</a>"
            +"<a href='https://"+domain+"/products/"+(product.variants[0].handle)+"' target='_blank'>"
                +"<span class='left spt-product-name'>hello</span>"
            +"</a>" 
            +"<select id='select-id-"+key+"' data-id="+key+"  class='left product-variant' onChange='onChangeSelect("+key+")'>"
                + optionVariants   
            +"</select>"
            +"<span id='old-price-"+key+"' class='left old-price'>"+product.variants[0].price+currency+"</span>"
            +"<span id='new-price-"+key+"' class='left new-price' data-value='"+newPrice+"'>"+newPrice +currency+"</span>"
        +"</div>"
        $(".cart-rule").append(html);
    });
    $(".cart-rule").append("<div class='spt-total'><span>Total</span><span class='spt-total-price'>"+total+currency+"</span></div>")
    $(".cart-rule").append("<button onClick='onSubmit()' class='spt-add-to-cart' type='button'>"+setting.cart_text+"</button>")
    addCss(setting)
}

function addCss(setting) {
    $(".spt-title").css({
        "color": setting.title_font_color,
        "font-family": setting.title_font_family,
        "font-weight": setting.title_font_style == 'italic' ? '' : setting.title_font_style,
        "font-style": (setting.title_font_style == 'italic' ? setting.title_font_style : ''),
    });
    $(".spt-total-price").css({
        "color": setting.amount_font_color,
        "font-family": setting.amount_font_family,
        "font-weight": setting.amount_font_style == 'italic' ? '' : setting.amount_font_style,
        "font-style": (setting.amount_font_style == 'italic' ? setting.amount_font_style : ''),
    });
    $(".spt-add-to-cart").css({
        "color": setting.cart_font_color,
        "font-family": setting.cart_font_family,
        "font-weight": setting.cart_font_style == 'italic' ? '' : setting.cart_font_style,
        "font-style": (setting.cart_font_style == 'italic' ? setting.cart_font_style : ''),
        "background-color": setting.back_ground_color
    });
    $(".new-price").css({
        "color": setting.new_price_font_color,
        "font-family": setting.new_price_font_family,
        "font-weight": setting.new_price_font_style == 'italic' ? '' : setting.new_price_font_style,
        "font-style": (setting.new_price_font_style == 'italic' ? setting.new_price_font_style : ''),
    });
    $(".old-price").css({
        "color": setting.old_price_font_color,
        "font-family": setting.old_price_font_family,
        "font-weight": setting.old_price_font_style == 'italic' ? '' : setting.old_price_font_style,
        "font-style": (setting.old_price_font_style == 'italic' ? setting.old_price_font_style : ''),
    });
    $(".spt-product-name").css({
        "color": setting.product_font_color,
        "font-family": setting.product_font_family,
        "font-weight": setting.product_font_style == 'italic' ? '' : setting.product_font_style,
        "font-style": (setting.product_font_style == 'italic' ? setting.product_font_style : ''),
    });
}

function onChangeSelect(key) {
    let cartRule = cartRules[key];
    var idVariant = document.getElementById("select-id-"+key+"").value;
    var variant = cartRule.variants.find(x => x.id_variant === idVariant);
    if(!cartRule.is_main_product){
        let newPrice =  parseFloat(variant.price);
        newPrice = parseFloat(variant.price) - (parseFloat(variant.price)*parseFloat(cartRule.reduction_percent))/100;
        $("#new-price-"+key+"").html(newPrice+currency);
    }else{
        $("#old-price-"+key+"").html(""+variant.price+currency+"");
        $("#new-price-"+key+"").html(""+variant.price+currency+"");
    }
    $("#variant-img-"+key+"").attr('src', variant.src);
}

function onSubmit() {
    var variants = [];              
    $(".related-products").each(function(i){
        let obj = {};
        obj['quantity'] = 1;
        obj['id'] = parseInt($("#select-id-"+i+"").val());
        variants.push(obj);
    })
    var deferreds = [];
    variants.forEach(function(e) {
        deferreds.push(addToCart(e));
    });
    $.when.apply($, deferreds).done(function() { 
        $.ajax({
            type: "GET",
            url: "https://"+domain+"/discount/"+cartRules.shift().code+"",
        });
        $.ajax({
            url: url+"api/cart-rule/add-to-cart",
            dataType: 'json', 
            type: "POST",
            data: {
                'id_shop': cartRules.shift().id_shop,
                'id_cart_rule': cartRules.shift().id
            },
            success: function(result){
                window.location.replace('/cart')
            },
            error: function (error) {
            }
        });
    })
}

function addToCart (item) {
    return $.ajax({
        type: "POST",
        url: "https://"+domain+"/cart/add.js",
        dataType: 'json',
        data: item,
        async:false,
        success: function(result){

        },
        error: function (error) {

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
