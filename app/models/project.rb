class Project < ActiveRecord::Base
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :sub_projects, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :name
  validates_uniqueness_of :name
  ATTACH_TYPES = ["Images", "Flash File", "Header Flash File"]

  def flash_file
    # file = File.new("test.xls")
    # spreadsheet = Roo::Excel.new(file.path)
    # (1..spreadsheet.last_row).each do |i|
    #   row = spreadsheet.row(i)
    #   puts "#{row[0]},#{row[0]}.dwg"
    # end
    self.attachments.where(attach_type: "Flash File").first
  end

  def header_flash_file
    self.attachments.where(attach_type: "Header Flash File").first
  end

  def image_files
  	self.attachments.where(attach_type: "Images")
  end

  def folder_name
    self.name.gsub(" ", "-")
  end
  
end
