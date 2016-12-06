class SubProject < ActiveRecord::Base
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :structure_drawings, foreign_key: :sub_project_id, dependent: :destroy
  has_many :bench_marks, foreign_key: :sub_project_id, dependent: :destroy
  has_many :hydralic_particulars, foreign_key: :sub_project_id, dependent: :destroy
  has_many :village_maps, foreign_key: :sub_project_id, dependent: :destroy

  # has_many :village_site_maps, :class_name => "VillageMap", :conditions => ["village_maps.map_type = ?", "Site Map"]

  has_many :site_maps, foreign_key: :sub_project_id, dependent: :destroy
  has_many :coordinates, foreign_key: :sub_project_id, dependent: :destroy
  has_many :custom_menus, dependent: :destroy
  #has_many :structure_drawings, :hydralic_particulars, :bench_marks, :coordinates, :village_maps, :site_maps


  belongs_to :project
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :name
  validates_uniqueness_of :name

  ATTACH_TYPES = ["Images", "Flash File"]

  def flash_file
    self.attachments.where(attach_type: "Flash File").first
  end

  def image_files
    self.attachments.where(attach_type: "Images")
  end

  def folder_name
    self.name.gsub(" ", "-")
  end
end
