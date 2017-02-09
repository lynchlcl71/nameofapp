var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
};



$(document).on('turbolinks:load ajaxSuccess', function(){refreshRating();
    $('.img-zoom').elevateZoom({ zoomType: "lens", 
      lensShape: "round", 
    lensSize: 300, 
    lensFadeIn: 500, 
    lensFadeOut: 600 
  });
});



// $(document).on('turbolinks:load', function(){

//     //Raty
//     $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
//     $('.rated').raty({ path: '/assets',
//       readOnly: true,
//       score: function() {
//         return $(this).attr('data-score');
//       }
//     });
    
//     // Initializing Elevate Zoom
//     $(".img-zoom").elevateZoom();
//   });
 

