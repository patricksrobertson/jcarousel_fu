jCarousel_fu
--------------
**Homepage**: [http://github.com/patricksrobertson/jcarousel_fu](http://github.com/patricksrobertson/jcarousel_fu)
**Author**: [Patrick Robertson](mailto:patricksrobertson@gmail.com)
**Copyright**: 2010
**License**: [MIT License](file:LICENSE)

About jCarousel
----------------
[jCarousel](http://sorgalla.com/jcarousel/) is a plugin for jQuery that makes pretty slideshows.  It operates on working with specially named div and ul tags within html.

About jCarousel_fu
------------------

jCarousel_fu is a rails plugin that creates helper methods for implementing jCarousel.  It also places 95% of the configuration of the jCarousel attributes into the rails view helper.  The normal use case will require 0 modification of javascript.  This plugin is fully tested using [rspec](http://rspec.info) so you can run tests to verify it works.

Installation:
-------------
Install the plugin with the command 
	script/plugin install git://github.com/patricksrobertson/jcarousel_fu.git
Run 
	rake jcarousel_fu:install:all
This will place the javascript files, image files, and CSS files for the default jCarousel skin into the public directories.  somewhere in the head of your page, put 
	<%= include_jcarousel_fu %>

Usage:
------
In your view you can use the helper method jcarousel_slideshow(options={}).  This creates the html necessary for a slideshow element.  It accepts the following parameters:

Hash of options.  The supported options as of now are:
	:auto_scroll=> true or time in seconds to automatically scroll by.  Defaults to 3 seconds if set to true.
	:images=> Array of images.  Will create html like this <li><img src="image_name" /></li>
	:content=> Array of content.  If you want to pass in more than just image paths, use this option.  It takes precedence over the images option.
	:animation=> Integer.  Time in milliseconds transition between slides.  If this is longer than the auto_scroll time it starts to behave funny.  Defaults to 1000ms when left out.
	:scroll=> Integer.  # of slides to scroll by at a time.  Default is 1.
	:visible=> Integer.  # of slides visible at a time.  Make sure your CSS skin container is wide enough to handle the number of slides you choose to be visible.
	:jcarousel_name=> String.  Changes the name of the div/UL elements that jCarousel is looking for.  You'll have to add your own function in application.js to cover this.  I built this in if you want to have two different types of jCarousels on one page.
	:css_style=> String.  Changes the skin used for the helper.  Defaults to jcarousel-skin-tango, which is the style defined in the skin.css added to your stylesheets folder. 
	:disable_prev=> True.  When enabled with true, disables the previous button.
	:disable_next=> True.  When enabled with true, disables the next button. 
	
To add external controls to your slideshow, use the helper method jcarousel_control(options={}).  This creates the html necessary for an external controller.  It accepts the following parameters:

Hash of options.  The supported options as of now are:	
	:length=> The number of items being slideshowed through.  Should just be the content/images array.size.
	:images=> Array of images.  This will create <a href="#" carousel_link="number"><img src="image.jpg"/></a> for each item.  The # of images you provide overrides anything placed in length.
	:content=> Array of content to link.  This is just meant if you want to name the links.  You could also get fancy and pass a blank space and use background images in the CSS to create buttons for external navigation this way.  Content overrides both images and length.

Examples:
-------

Base usage, non-auto scrolling collection of images.
	# View
	<% photos = ["image_1.jpg","image_2.jpg"] %>
	<%= jcarousel_slideshow :images=>photos %>
	
	# Creates html
	<div id="jcarousel-slides" class="jcarousel-skin-tango">
		<ul class="jcarousel-slides">
			<li><img src="/images/image_1.jpg"/></li>
			<li><img src="/images/image_2.jpg"/></li>
		</ul>
	</div>

This usage scrolls the image every 3 seconds.	
	# View
	<% photos = ["image_1.jpg","image_2.jpg"] %>
	<%= jcarousel_slideshow :images=>photos,:auto_scroll=>true %>
	
	#Creates html
	<div id="jcarousel-slides" class="jcarousel-skin-tango">
		<ul class="jcarousel-slides auto-scroll">
			<li><img src="/images/image_1.jpg"/></li>
			<li><img src="/images/image_2.jpg"/></li>
		</ul>
	</div>


This usage scrolls the image every 3 seconds with an animation of 500 milliseconds.	
	# View
	<% photos = ["image_1.jpg","image_2.jpg"] %>
	<%= jcarousel_slideshow :images=>photos,:auto_scroll=>true, :animation=>"500" %>

	#Creates html
	<div id="jcarousel-slides" class="jcarousel-skin-tango">
		<ul animation="500" class="jcarousel-slides auto-scroll">
			<li><img src="/images/image_1.jpg"/></li>
			<li><img src="/images/image_2.jpg"/></li>
		</ul>
	</div>

This usage scrolls the images every 8 seconds.	
	# View
	<% photos = ["image_1.jpg","image_2.jpg"] %>
	<%= jcarousel_slideshow :images=>photos,:auto_scroll=>"8" %>
	
	#Creates html
	<div id="jcarousel-slides" class="jcarousel-skin-tango">
		<ul auto="8" class="jcarousel-slides auto-scroll">
			<li><img src="/images/image_1.jpg"/></li>
			<li><img src="/images/image_2.jpg"/></li>
		</ul>
	</div>

This usage scrolls the image every 8 seconds, and doesn't wrap the collection in image_tags.	
	# View
	<% photos = ["image_1.jpg","image_2.jpg"] %>
	<%= jcarousel_slideshow :content=>photos,:auto_scroll=>"8" %>
	
	#Creates html
	<div id="jcarousel-slides" class="jcarousel-skin-tango">
		<ul auto="8" class="jcarousel-slides auto-scroll">
			<li>image_1.jpg</li>
			<li>image_2.jpg</li>
		</ul>
	</div>
	
This is a basic external controller.
	# View
	<%= jcarousel_control :length=>"3" %>
	
	#Creates html
	<div class="jcarousel-control">
		<a carousel_link="1" href="#">1</a>
		<a carousel_link="2" href="#">2</a>		
		<a carousel_link="3" href="#">3</a>
	</div>

This is an external control using thumbnails.
	#View
	<% for photo in @photos %>
	<% thumb_array = photo.public_filename(:thumb) %>
	<% photo_array = photo.public_filename %>
	<% end %>
	<%= jcarousel_control :images=> thumb_array %>
	
	#Creates html
	<div class="jcarousel-control">
		<a carousel_link="index" href="#"><img src="thumb.jpg" /></a>
		...
	</div>

This is an external control using content.
	#View
	<% external_content = ["jim","bob","sue"] %>
	<%= jcarousel_control :content=>external_content %>
	
	#Creates html
	<div class="jcarousel-control">
		<a carousel_link="1" href="#">jim</a>
		<a carousel_link="2" href="#">bob</a>		
		<a carousel_link="3" href="#">sue</a>		
	</div>

To Do's
-------
* add the features I never use but other people might.

Copyright (c) 2010 [Patrick Robertson](http://p-rob.me), released under the MIT license  
