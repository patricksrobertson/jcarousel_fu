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
	var auto_scrill_animation = 1000
	if (auto_scroll_var == true) {
		var auto_scroll_timing = 0
		var auto_scroll_val = 3
		auto_scroll_timing = jQuery(".jcarousel-slides").attr("auto")
		auto_scroll_animation = jQuery(".jcarousel-slides").attr("animation")		
		if (auto_scroll_timing > 0) {
			auto_scroll_val = auto_scroll_timing
		}
	}
	jQuery(".jcarousel-slides").jcarousel( {
	auto: auto_scroll_val,
	scroll:1,
	animation: auto_scroll_animation,
	visible:1,
	wrap: "both"
  });
});