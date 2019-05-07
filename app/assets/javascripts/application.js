// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require slick.min.js
// Left Slidebar controls



$(document).ready(function () {
    $('.slider').slick({
        autoplay: true,
        autoplaySpeed: 1000,
        speed: 2000,
        dots: false,
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


$(document).ready(function() {
	$('.pick').on('click',function(event){
	   // event.preventDefault();
	   var linkUrl = $(this).attr('href');
	   console.log(linkUrl)

	   // Ajaxリクエストを送ってRSSから自分のところに情報入れる
	    $.ajax({
	      url: '/browsing_histories', //どこに遷移したいか(ルーティング)
	      type: 'POST',
	      data: {url: linkUrl},  //書き方変更
	      dataType: 'json'
	    })

	    window.location.href = linkUrl;
 });
});



    $(document).on('click','.stock-already', function(event){
        var entryId = $(this).val();
         // $(this).text("STOCK");
         $(this).removeClass('stock-already');
         $(this).addClass('stock-icon');
       // Ajaxリクエストを送って自分のところから自分のところに情報入れる
        $.ajax({
          url: `/entry/${entryId}/stocks`, //どこに遷移したいか(ルーティング)
          type: 'DELETE',
          data: {
            'entryid': entryId
          },
          dataType: 'json'
        })

 });



    $(document).on('click','.stock-icon', function(event){
        var entryId = $(this).val();
         // $(this).text("CANCEL");
         $(this).removeClass('stock-icon');
         $(this).addClass('stock-already');
       // Ajaxリクエストを送って自分のところから自分のところに情報入れる
        $.ajax({
          url: `/entry/${entryId}/stocks`, //どこに遷移したいか(ルーティング)
          type: 'POST',
          data: {
            'entryid': entryId
          },
          dataType: 'json'
        })
 });


    $(document).on('click','.stock-delete', function(event){
        var entryId = $(this).val();
       // Ajaxリクエストを送って自分のところから自分のところに情報入れる
        $.ajax({
          url: `/entry/${entryId}/stocks`, //どこに遷移したいか(ルーティング)
          type: 'DELETE',
          data: {
            'entryid': entryId
          },
          dataType: 'json'
        })
        $(this).parent().parent().hide()

 });

