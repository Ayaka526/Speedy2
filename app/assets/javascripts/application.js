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
//= require_tree .

// Left Slidebar controls

    function set2fig(num) {
       // 桁数が1桁だったら先頭に0を加えて2桁に調整する
       var ret;
       if( num < 10 ) { ret = "0" + num; }
       else { ret = num; }
       return ret;
    }
    function showClock() {
       var nowTime = new Date();
       var nowHour = set2fig( nowTime.getHours() );
       var nowMin  = set2fig( nowTime.getMinutes() );
       var nowSec  = set2fig( nowTime.getSeconds() );
       var msg =  nowHour + ":" + nowMin + ":" + nowSec;
       document.getElementById("topClock").innerHTML = msg;
    }
    setInterval('showClock()',1000);


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


API_KEY = "51a8b98ae0d86f7f4cd5b73e088cb578";
$(document).ready(function() {
  $(function(){
    $('#search').on('click', function() {
      $.ajax({
      url: "http://api.openweathermap.org/data/2.5/weather?q=" + $('#cityname').val() + "&units=metric&appid=" + API_KEY,
      dataType : 'jsonp',
      }).done(function (data){
        //success
        $('#place').text(data.name);
        $('#temp_max').text(data.main.temp_max);
        $('#temp_min').text(data.main.temp_min);
        $('#humidity').text(data.main.humidity);
        $('#weather').text(data.weather[0].main);
        $('img').attr("src","http://openweathermap.org/img/w/" + data.weather[0].icon + ".png");
        $('img').attr("alt",data.weather[0].main);
      }).fail(function (data) {
         //failed
         alert('通信に失敗しました。');
      });
    });
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

