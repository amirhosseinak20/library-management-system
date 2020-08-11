module ApplicationHelper
  require 'active_support/core_ext'

  def page_title(separator = " | ")
    [content_for(:title), 'Library Management System'].compact.join(separator)
  end

  def page_heading(title)
    content_for(:title) { title }
  end

  def user_full_name
    current_user ? "#{current_user.first_name} #{current_user.last_name}" : "John Doe"
  end

  def avatar_url(user_id)
    user = User.where(id: user_id)[0]
    resource_image_url(user.avatar)
  end

  def numeric?(str)
    return true if str =~ /\A\d+\Z/

    begin
      true if Float(str)
    rescue StandardError
      false
    end
  end

  def authenticated?
    !!current_user
  end

  def resource_image_url(image_field)
    if image_field&.attached?
      url_for(image_field)
    else
      image_url("404.jpg")
    end
  end
end
