jCarousel_fu
--------------
**Homepage**: [http://github.com/patricksrobertson](http://github.com/patricksrobertson/jcarousel_fu)
**Author**: [Patrick Robertson](mailto:patricksrobertson@gmail.com)
**Copyright**: 2010
**License**: [MIT License](file:LICENSE)

jCarousel_fu is a rails plugin that creates helper methods for using the jQuery jCarousel plugin.  I find that you end up repeating yourself far too often when creating the necessary html for making a slideshow so I wanted to streamline this.  This plugin is fully tested using [rspec](http://rspec.info) so you can run tests to verify it works.

Installation:
-------------
* Install the plugin with the command script/plugin install git:needtoupdateyouwhenImakeyoupublicagain
* Run rake jcarousel_fu:install:all.  This will place the javascript files, image files, and CSS files for the default jCarousel skin into the public directories.
* somewhere in the head of your page, put <%= include_jcarousel_fu %>

Usage:
------
In your view you can use the helper method jcarousel_slideshow(images=[],options={}).  This creates the html necessary for a slideshow element.  It accepts the following parameters:
* Array of images.  These are the slideshow items.
* Hash of options.  The only recognized option so far is :auto_scroll.  When set to true the slideshow will scroll automatically.

Example:
-------

	# View
	<% photos = ["image_1.jpg","image_2.jpg"] %>
	<%= jcarousel_slideshow photos %>
	
	# Creates html
	<div id="jcarousel-slides" class="jcarousel-skin-tango">
		<ul class="jcarousel-slides">
			<li><img src="/images/image_1.jpg"/></li>
			<li><img src="/images/image_2.jpg"/></li>
		</ul>
	</div>
	
	# View
	<% photos = ["image_1.jpg","image_2.jpg"] %>
	<%= jcarousel_slideshow photos,:auto_scroll=>true %>
	
	#Creates html
	<div id="jcarousel-slides" class="jcarousel-skin-tango">
		<ul class="jcarousel-slides-auto">
			<li><img src="/images/image_1.jpg"/></li>
			<li><img src="/images/image_2.jpg"/></li>
		</ul>
	</div>


Copyright (c) 2010 [Patrick Robertson](http://p-rob.me), released under the MIT license  
