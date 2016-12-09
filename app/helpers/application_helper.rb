module ApplicationHelper
  def main_collapse_in(project_id)
    if params[:project_id] == project_id.to_s || (params[:controller] == 'projects' && params[:id] == project_id.to_s)
      "in"
    end
  end

  def main_collapse_class(project_id)
    if params[:project_id] == project_id.to_s || (params[:controller] == 'projects' && params[:id] == project_id.to_s)
      "active"
    end
  end

  def main_control_class(project_id)
    if params[:project_id] == project_id.to_s || (params[:controller] == 'projects' && params[:id] == project_id.to_s)
      ""
    else
      "hidden"
    end
  end

  def sub_project_active(project_id)
    if (params[:controller] == 'sub_projects' && params[:id] == project_id.to_s) || (params[:sub_project_id] == project_id.to_s)
      "active"
    end
  end

  def attachment_cell(attach, href=nil)
    href = attachment_path(attach) unless href
    case attach.attach_type
      when "Digitised Copy"
        "<a class='download' href='#{href}'> <i class='fa fa-file'></i> #{attach.attach_type} </a>"
       when "Auto cad Map"
        "<a class='download' href='#{href}'> <i class='fa fa-file'></i> #{attach.attach_type} </a>"  
      when "Photo Copy"
        "<a class='download' href='#{href}'> <i class='fa fa-file-powerpoint-o'></i> #{attach.attach_type} </a>"
      when "Scanned Copy"
        "<a class='download' href='#{href}'> <i class='fa fa-file-image-o'></i> #{attach.attach_type} </a>"
      when "Hp Copy" 
        "<a class='download' href='#{href}'> <i class='fa fa-file-excel-o'></i> #{attach.attach_type} </a>"
      when "Pdf Copy" 
        "<a class='download' href='#{href}'> <i class='fa fa-file-pdf-o'></i> #{attach.attach_type} </a>"  
      when "Excel Sheet" 
        "<a class='download' href='#{href}'> <i class='fa fa-file-pdf-o'></i> #{attach.attach_type} </a>"
      when "Word File" 
        "<a class='download' href='#{href}'> <i class='fa fa-file-pdf-o'></i> #{attach.attach_type} </a>"  
      else
        "<a class='download' href='#'> <i class='fa fa-file'></i> No File </a>" 
    end
  end

  def sub_menu_attachment_cell(attach, type)
    if attach
      "<a href='#{attachment_path(attach)}'>#{type}</a>"
    else
      "#{type}<font color='red'>(No File)</font>"
    end
  end

  def header_flash_file
    (@project and @project.header_flash_file) ? @project.header_flash_file.attachment.url : asset_path('Reach-main.swf')
  end

end
