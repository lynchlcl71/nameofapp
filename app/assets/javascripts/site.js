$(document).on('turbolinks:load', function(){

    //Raty
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
    
    // Initializing Elevate Zoom
    $(".img-zoom").elevateZoom();
  });
 