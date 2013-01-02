module ApplicationHelper
  def dynamic_login_links
    if @auth
      render 'shared/authnav'
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

  def my_note_numbers
    if @notes_array
      @notes_array.count
    else
      0
    end
  end

  def all_note_numbers
    if @all_notes_array
      @all_notes_array.count 
    else
      0
    end
  end

end
