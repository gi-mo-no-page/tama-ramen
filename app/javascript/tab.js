$(function() {
  console.log('ok')
  $('.tab_btn').on('click', function() {
    $('.tab_item').removeClass("is-active-item");
    $($(this).attr("href")).addClass("is-active-item");

    //以下２行を追加
    $('.tab_btn').removeClass('is-active-btn');
    $(this).addClass('is-active-btn');
  });
});