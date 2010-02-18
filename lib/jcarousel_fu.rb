module JcarouselFu
  
  def jcarousel_slideshow(image_array=[])
   images = image_array.collect {|w| content_tag(:li,image_tag(w))}
    content_tag(:div,:id=>"jcarousel-slides",:class=>"jcarousel-skin-tango") do
      content_tag(:ul,:class=>"jcarousel-slides") do
        images.each do |image|
        end
      end
    end
  end
end
