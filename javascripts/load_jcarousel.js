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
	var auto_scroll_var = jQuery(".jcarousel-slides").hasClass("auto-scroll")
	var auto_scroll_val = 0
	if (auto_scroll_var == true) {
		var auto_scroll_val = 3
	}
	jQuery(".jcarousel-slides").jcarousel( {
	auto: auto_scroll_val,
	scroll:1,
	//auto: 3,
	animation: 1000,
	visible:1,
	wrap: "both"
  });
});