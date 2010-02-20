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
	var auto_scroll_val = 0
	var auto_scroll_animation = 1000
	var scroll_by = 1
	if (jQuery(".jcarousel-slides").attr("scroll") !== undefined) {
		scroll_by = parseInt(jQuery(".jcarousel-slides").attr("scroll"))
	}
	if (jQuery(".jcarousel-slides").attr("animation") !== undefined ) {
		auto_scroll_animation = parseInt(jQuery(".jcarousel-slides").attr("animation"))
	}
	if (jQuery(".jcarousel-slides").attr("auto") !== undefined) {
		auto_scroll_val = parseInt(jQuery(".jcarousel-slides").attr("auto"))
	}

	jQuery(".jcarousel-slides").jcarousel( {
	auto: auto_scroll_val,
	scroll: scroll_by,
	animation: auto_scroll_animation,
	visible:1,
	wrap: "both"
  });
});