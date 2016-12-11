class VillageMap < ActiveRecord::Base
  belongs_to :sub_project, foreign_key: :sub_project_id
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  ATTACH_TYPES = ["Digitised Copy", "Pdf Copy"]
  validates_presence_of :village_name

  def self.site_maps
  	where(:map_type => 'Site Map')
  end

  def self.normal_maps
  	where(:map_type => 'Village Map')
  end

end
