class CustomMenu < ActiveRecord::Base
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :menu_name, :attachment_type
  validates_uniqueness_of :menu_name, :scope => [:sub_menu_name, :attachment_type, :sub_project_id], :message => ', Sub Menu Name, Attachment type has to be Unique'

  belongs_to :sub_project, foreign_key: :sub_project_id

end
