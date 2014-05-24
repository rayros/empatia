$(document).ready(function (){
//  $('.img-responsive').hide();
//  $('.post-url').addClass('loader');  
  var posts = document.querySelectorAll('.post');
  var imgLoad = imagesLoaded(posts);
  imgLoad.on('always', function(instance){
      $('.post-url').removeClass('loader');
      $(".img-responsive").show();
  });
  imgLoad.on('done', function(instance){
      $('.post-url').removeClass('loader');
      $(".img-responsive").show();
  });
  imgLoad.on('fail', function(){
      $('.post-url').removeClass('loader');
      $(".img-responsive").show();
  });
  imgLoad.on('progress', function( instance, image ) {
      var elem = $(image.img);
      elem.show();
      elem.parent().removeClass('loader');
  });
});
