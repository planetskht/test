class SiteMap < ActiveRecord::Base
	belongs_to :sub_project, foreign_key: :sub_project_id
	has_many :attachments, as: :attachable, dependent: :destroy
  	accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  	ATTACH_TYPES = ["Digitised Copy", "Pdf Copy"]
  	
end
