module ApplicationHelper
  def tn2br(str)
    t(str).gsub(/\n/,'<br/>').html_safe
  end
end
