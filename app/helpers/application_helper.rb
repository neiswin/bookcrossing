module ApplicationHelper

  include Pagy::Frontend
  
  def full_title(page_title = "")
    base_title = "Bookcrossing"
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end
end
