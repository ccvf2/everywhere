/**
 * Base js functions
 */

$(document).ready(function(){
    var $container = $('.grid-boxes');

    var gutter = 30;
    var min_width = 200;
    $container.imagesLoaded( function(){
        $container.masonry({
            itemSelector : '.grid-boxes-in',
            gutterWidth: gutter,
            isAnimated: true,
              columnWidth: function( containerWidth ) {
            	// 컨테이너 폭에서 2픽셀
                var box_width = (((containerWidth - 2*gutter)/3) | 0) ;

                if (box_width < min_width) {
                    box_width = (((containerWidth - gutter)/2) | 0);
                }

                if (box_width < min_width) {
                    box_width = containerWidth;
                }

                $('.grid-boxes-in').width(box_width);

                return box_width;
              }
        });
    });
});
