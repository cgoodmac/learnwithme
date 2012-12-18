module ApplicationHelper
  def dynamic_login_links
    if @auth
      link_to "Logout", logout_path
    else
      link_to "Login", root_path
    end
  end

  def dynamic_create_course_link
    if @auth
      link_to "Create Course", new_course_path
    else
    end
  end
end
