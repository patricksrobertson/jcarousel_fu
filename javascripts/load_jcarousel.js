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
	var slides_visible = 1
	var prev_button = "<div></div>"
	var next_button = "<div></div>"
	if (jQuery(".jcarousel-slides").attr("scroll") !== undefined) {
		scroll_by = parseInt(jQuery(".jcarousel-slides").attr("scroll"))
	}
	if (jQuery(".jcarousel-slides").attr("animation") !== undefined ) {
		auto_scroll_animation = parseInt(jQuery(".jcarousel-slides").attr("animation"))
	}
	if (jQuery(".jcarousel-slides").attr("auto") !== undefined) {
		auto_scroll_val = parseInt(jQuery(".jcarousel-slides").attr("auto"))
	}
	if (jQuery(".jcarousel-slides").attr("visible") !== undefined) {
		slides_visible = parseInt(jQuery(".jcarousel-slides").attr("visible"))
	}
	if (jQuery(".jcarousel-slides").attr("disable_prev") !== undefined) {
		prev_button = null
	}
	if (jQuery(".jcarousel-slides").attr("disable_next") !== undefined) {
		next_button = null
	}
	jQuery(".jcarousel-slides").jcarousel( {
	auto: auto_scroll_val,
	scroll: scroll_by,
	animation: auto_scroll_animation,
	visible: slides_visible,
	wrap: "both",
	buttonPrevHTML: prev_button,
	buttonNextHTML: next_button
  });
});