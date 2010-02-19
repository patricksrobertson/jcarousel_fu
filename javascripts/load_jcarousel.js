function slides_initCallback(carousel)
{
    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};
jQuery(document).ready(function() {
	jQuery(".jcarousel-slides").jcarousel( {
	scroll: 1,
	visible:1,
	wrap: "both"
  });
	jQuery(".jcarousel-slides-auto").jcarousel( {
	scroll: 1,
	visible:1,
	auto: 8, 
	animation: 1000,
	wrap: "both",
    initCallback: slides_initCallback
  });
});