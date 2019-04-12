
$(document).ready(function(){
    $("#theTarget").skippr({
        transition: 'slide',
        speed: 3000,
        easing: 'easeOutQuart',
        navType: 'block',
        childrenElementType: 'div',
        arrows: true,
        autoPlay: true,
        autoPlayDuration: 2000,
        keyboardOnAlways: true,
        hidePrevious: false
    });
});


$(document).ready(function () {
    $('.slider').slick({
        autoplay: true,
        autoplaySpeed: 1000,
        speed: 2000,
        dots: true,
        arrows: false,
        centerMode: true,
        centerPadding: '0%'
    });
});


$(document).ready(function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });

});