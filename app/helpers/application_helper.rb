module ApplicationHelper

  # Returns the full page title on a per-page basis. Needs a provide(:title, 'My Title') on the page
  def full_title(page_title)
    base_title = 'Ruby on Rails Tutorial Sample App'
    if page_title.empty?
        base_title
    else
        "#{base_title} | #{page_title}"
    end
  end
end
