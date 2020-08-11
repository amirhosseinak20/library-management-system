module ApplicationHelper
  def page_title(separator = " | ")
    [content_for(:title), 'Library Management System'].compact.join(separator)
  end

  def page_heading(title)
    content_for(:title) { title }
  end

  def user_full_name
    current_user ? "#{current_user.first_name} #{current_user.last_name}" : "John Doe"
  end

  def user_avatar_url
    if current_user&.avatar&.attached?
      url_for(current_user.avatar)
    else
      gravatar_image_url(current_user&.email)
    end
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
end
