class StructureDrawing < ActiveRecord::Base
  belongs_to :sub_project, foreign_key: :sub_project_id
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  ATTACH_TYPES = ["Digitised Copy", "Photo Copy", "Scanned Copy", "Hp Copy"]
  validates_presence_of :title

  def self.canal_list
  	where(:structure_type => 'Canal')
  end

  def self.list
  	where(:structure_type => nil)
  end

end
