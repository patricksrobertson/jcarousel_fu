module JcarouselFu
  
  # includes all the files necessary to use jcarousel_fu
  # just put <%= include_jcarousel_fu %> in the head of your page
  def include_jcarousel_fu(*args)
    content = javascript_include_tag('jquery.j_carousel/jquery.jcarousel.pack.js',
                                     'jquery.j_carousel/load_jcarousel')
    content << "\n#{stylesheet_link_tag('jquery.jcarousel.css')}"
    content << "\n#{stylesheet_link_tag('skin.css')}"                                
  end
  
  def jcarousel_slideshow(image_array=[],options={})
    ul_class = "jcarousel-slides"
    if options[:auto_scroll] == true
      ul_class << "-auto"
    end    
    content_tag :div, :id=>ul_class,:class=>"jcarousel-skin-tango" do
      content_tag :ul,:class=>ul_class do
        image_array.collect {|w| content_tag(:li,image_tag(w))}
      end
    end
  end
  
end
