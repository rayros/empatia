jQuery ->
  $('#posts').imagesLoaded ->
    $('#posts').masonry itemSelector: '.post', columnWidth: '.post', transitionDuration: 0, isFitWidth: true
