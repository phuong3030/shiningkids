//= require cloud-zoom
//= require home/cart
//= require jcarousel

(function ($) {

  var jcarousel = $('.tumbSlider');

  jcarousel.on('jcarousel:reload jcarousel:create', function () {
    var width = jcarousel.innerWidth();

    if (width >= 600) {
      width = width / 3;
    } else if (width >= 350) {
      width = width / 2;
    }

    jcarousel.jcarousel('items').css('width', width + 'px');
  })
  .jcarousel({
    wrap: 'circular',
    easing: 'easeOutBounce',
    animation: 750
  });

  $('.jcarousel-control-prev').jcarouselControl({
    target: '-=1'
  });

  $('.jcarousel-control-next').jcarouselControl({
    target: '+=1'
  });

}) (jQuery);

