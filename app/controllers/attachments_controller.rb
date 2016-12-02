class AttachmentsController < ApplicationController
  def show
    @model = Attachment.find(params[:id])
    send_file(@model.attachment.path,
          :filename => @model.attachment.file.filename,
          :type => @model.attachment.file.content_type,
          :disposition => 'attachment',
          :url_based_filename => true)
  end
end
