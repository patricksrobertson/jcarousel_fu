module JcarouselFu
  
  # includes all the files necessary to use jcarousel_fu
  # just put <%= include_jcarousel_fu %> in the head of your page
  def include_jcarousel_fu(*args)
    content = javascript_include_tag('jquery.j_carousel/jquery.jcarousel.pack.js',
                                     'jquery.j_carousel/load_jcarousel')
    content << "\n#{stylesheet_link_tag('jquery.jcarousel.css')}"
    content << "\n#{stylesheet_link_tag('skin.css')}"                                
  end
  
  def jcarousel_slideshow(options={})
    options[:images] ||= []
    options[:content] ||= []
    options[:jcarousel_name] ||= "jcarousel-slides"
    options[:css_style] ||= "jcarousel-skin-tango"
    div_id = options[:jcarousel_name].clone
    ul_class = options[:jcarousel_name]
    
    auto_scroll = options[:auto_scroll]
    unless auto_scroll.nil? || (false == auto_scroll)
      ul_class << " auto-scroll"
      unless auto_scroll == true
        auto_value = auto_scroll
      end
    end
    
    content_array = []
    unless options[:content].empty?
      content_array = options[:content].collect {|w| content_tag(:li,w)}
    else
      content_array = options[:images].collect {|w| content_tag(:li,image_tag(w))}
    end
    
    content_tag :div, :id=>div_id,:class=>options[:css_style] do
      content_tag :ul,:class=>ul_class,
                  :id=>div_id,
                  :auto=>auto_value,
                  :animation=>options[:animation],
                  :scroll=>options[:scroll],
                  :visible=>options[:visible] do
          content_array
      end
    end
  end
  
end
