module ApplicationHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
    content_for :title do
      @content_for_title
    end
  end
  
  def show_title?
    @show_title.nil?
  end
end
