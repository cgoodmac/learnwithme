$(function(){

  $('#video_form_wrapper').hide();
  $('#add_video').click(show_video_form);

  $('#ebook_form_wrapper').hide();
  $('#add_ebook').click(show_ebook_form);

  $('#audio_form_wrapper').hide();
  $('#add_audio').click(show_audio_form);

   $("#home_splash").backstretch("splash_image.jpg");

});

function show_video_form()
{
  $('#video_form_wrapper').slideToggle();
}

function show_ebook_form()
{
  $('#ebook_form_wrapper').slideToggle();
}

function show_audio_form()
{
  $('#audio_form_wrapper').slideToggle();
}