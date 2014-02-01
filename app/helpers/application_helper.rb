module ApplicationHelper
  def full_title(page_title)
<<<<<<< HEAD
  	base_title = "Ruby on Rails Tutorial Sample App"
  	if page_title.empty?
  	  base_title
  	else
  	  "#{base_title} | #{page_title}"
  	end
=======
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
>>>>>>> filling-in-layout
  end
end
