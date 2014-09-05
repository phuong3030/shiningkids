(function ($) {
  var cartContent = $('.cart-content');

  $('.btn-cart').click(function (e) {

    $.ajax({
      url: window.location.origin + '/customer/cart',
      type: 'POST',
      dataType: 'json',
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        "HTTP_X_REQUESTED_WITH": "XMLHttpRequest"
      },
      data: { 
        id: e.currentTarget.getAttribute('data-id')
      },
      error: function (xhr, status, error) {

        window.location.href = '/customer/sign_in';
      },
      success: function(data) { 
      
        buildCart(data);
        console.log(data);
      }
    });
  });

  $('.btn-checkout').click(function (e) {
     $.ajax({
      url: window.location.origin + '/customer/checkout',
      type: 'POST',
      dataType: 'json',
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        "HTTP_X_REQUESTED_WITH": "XMLHttpRequest"
      },
      data: { 
        
      },
      error: function (xhr, status, error) {
        alert('Server error!');
      },
      success: function(data) { 
        window.location.href = '/customer/view-orders';
      }
    });
  });

  $('.block-cart-header').click(function (e) {

    cartContent.slideToggle();
     
  });

  function buildCart (carts) {

    var i = 0,
        cartDOMs = "";

    for (; i < carts.length; i++) {
      if (i < 3) { 
        cartDOMs = cartDOMs + cartItem(carts[i]);
      }
      total += carts[i].product.price;
    } 

    $('ol.cart-sidebar').html(cartDOMs);
    $('.amount-2 .price').html(total);
    $('.subtotal .price').html(total);
  }

  function cartItem (item) {
    return '<li class="item"><div class="product-control-buttons">' + 
       '<a href="#" class="btn-remove">Remove This Item</a></div>' + 
       '<a href="/product/' + item.product.id + 
       '" title="' + item.product.name + '" class="product-image">' +
       '<img src="' + item.product.product_images[0].image.url + '"' + 
       '</a><p class="product-name"><a href="/product/' + item.product.id +
       '">' + item.product.name + '</a></p><div class="product-details">' +
       '<strong>1</strong>x<span class="price">' + item.product.price +
       '</span></div>';
  }

}) (jQuery);
