// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require bootstrap
//= require_tree .

function collage() {
    $('.Collage').removeWhitespace().collagePlus(
    	{
            /*
             * The ideal height you want your row to be. It won't set it exactly to this as
             * plugin adjusts the row height to get the correct width
             */
            'targetHeight'    : 400,

            /*
             * how quickly you want images to fade in once ready can be in ms, "slow" or "fast"
             * This is only used in the default fade in effect. Timing of the other effects is
             * controlled in CSS
             */
            'fadeSpeed'       : "fast",

            /*
             * which effect you want to use for revealing the images (note CSS3 browsers only),
             * Options are effect-1 to effect-6 but you can also code your own
             * Default is the safest option for supporting older browsers
             */
            'effect'          : 'default',

            /*
             * vertical: effects applied per row to give the impression of descending appearance
             * horizontal: effects applied in order of appearance in the row to give a horizontal appearance
             */
            'direction'       : 'vertical'

            /*
            * Sometimes there is just one image on the last row and it gets blown up to a huge size to fit the
            * parent div width. To stop this behaviour, set this to true
            */
            'allowPartialLastRow'       : false
       
            'fadeSpeed' : 2000
        }
    );
};

var resizeTimer = null;
$(window).bind('resize', function() {
    // hide all the images until we resize them
    // set the element you are scaling i.e. the first child nodes of ```.Collage``` to opacity 0
    $('.Collage .Image_Wrapper').css("opacity", 0);
    // set a timer to re-apply the plugin
    if (resizeTimer) clearTimeout(resizeTimer);
    resizeTimer = setTimeout(collage, 200);
});
