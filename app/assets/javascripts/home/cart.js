(function ($) {

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

  function buildCart (carts) {
  
  }

}) (jQuery);
