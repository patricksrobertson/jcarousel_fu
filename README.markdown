jCarousel_fu
--------------
**Homepage**: [http://github.com/patricksrobertson](http://github.com/patricksrobertson/jcarousel_fu)
**Author**: [Patrick Robertson](mailto:patricksrobertson@gmail.com)
**Copyright**: 2010
**License**: [MIT License](file:LICENSE)

jCarousel_fu is a rails plugin that creates helper methods for using the jQuery jCarousel plugin.  I find that you end up repeating yourself far too often when creating the necessary html for making a slideshow so I wanted to streamline this.  This plugin is fully tested using [rspec](http://rspec.info) so you can run tests to verify it works.

Installation:
-------------
* Install the plugin with the command script/plugin install git://github.com/patricksrobertson/jcarousel_fu.git
* Run rake jcarousel_fu:install:all.  This will place the javascript files, image files, and CSS files for the default jCarousel skin into the public directories.
* somewhere in the head of your page, put <%= include_jcarousel_fu %>

Usage:
------
In your view you can use the helper method jcarousel_slideshow(options={}).  This creates the html necessary for a slideshow element.  It accepts the following parameters:

Hash of options.  The supported options as of now are:
	:auto_scroll=> true or time in seconds to automatically scroll by.  Defaults to 3 seconds if set to true.
	:images=> Array of images.  Will create html like this <li><img src="image_name" /></li>
	:content=> Array of content.  If you want to pass in more than just image paths, use this option.  It takes precedence over the images option.
	:animation=> Integer.  Time in milliseconds transition between slides.  If this is longer than the auto_scroll time it starts to behave funny.  Defaults to 1000ms when left out.

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


Copyright (c) 2010 [Patrick Robertson](http://p-rob.me), released under the MIT license  
