$(document).ready(function (){
  $(".img-responsive").hide();
  var imgLoad = imagesLoaded("img");
  imgLoad.on( 'progress', function( instance, image ) {
      $(image.img).show();
  });
});
