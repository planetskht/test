require 'csv'

admin = User.create_with(password: "test1234", password_confirmation: "test1234", role: "Admin").find_or_create_by(email: "admin@basemaps.in")
editor = User.create_with(password: "test1234", password_confirmation: "test1234",role: "Employee").find_or_create_by(email: "employee@basemaps.in")
guest = User.create_with(password: "test1234", password_confirmation: "test1234",role: "Guest").find_or_create_by(email: "guest@basemaps.in")


@data_url = Rails.root + "../"+"basemaps_data/"

def import_coordinates(sp, xls)
  file = @data_url + "#{sp.folder_name}/#{xls}"
  if File.exist?(file)
    xls_file = File.new(file)
    puts xls
    spreadsheet = open_spreadsheet(xls_file)
    (4..spreadsheet.last_row).each do |i|
    	row = spreadsheet.row(i)
    	sp.coordinates.create(title: row[0], east_utm: row[1], north_utm: row[2], lattitude: row[3], longitude: row[4], description: row[5], )
    end
  else
    puts "#{xls} file not exist"
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.path)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else []
  end
end

def import_flash_images(sp, swf)
  file = @data_url + "#{sp.folder_name}/#{swf}"
  if File.exist?(file)
    swf_file = File.new(file)
    sp.attachments.create(attach_type: "Flash File", attachment: swf_file)
  else
    puts "#{swf} file not exist"
    swf_file = File.new(Rails.root + "app/assets/images/AP_TGP_Canal.swf")
    sp.attachments.create(attach_type: "Flash File", attachment: swf_file)
  end
end

def import_bench_marks(sp, row, f1, f2, f3)
  bm = sp.bench_marks.find_or_create_by(title: row[0])
  bm.save!

  bm.attachments.create(attach_type: "Digitised Copy", attachment: f1) if f1
  bm.attachments.create(attach_type: "Pdf Copy", attachment: f2) if f2
  bm.attachments.create(attach_type: "Excel Sheet", attachment: f3) if f3
end

def import_hydraulic(sp, row, f1, f2, f3, f4)
  hp = sp.hydralic_particulars.find_or_create_by(title: row[0], hydralic_type: "Canal")
  hp.save!

  hp.attachments.create(attach_type: "Digitised Copy", attachment: f1) if f1
  hp.attachments.create(attach_type: "Pdf Copy", attachment: f2) if f2
  hp.attachments.create(attach_type: "Hp Copy", attachment: f3) if f3
  hp.attachments.create(attach_type: "Word File", attachment: f4) if f4
end

def import_kmwise(sp, row, f1, f2, f3)
  sm = sp.site_maps.find_or_create_by(title: row[0])
  sm.save!

  sm.attachments.create(attach_type: "Digitised Copy", attachment: f1) if f1
  sm.attachments.create(attach_type: "Pdf Copy", attachment: f2) if f2
end

def import_structures(sp, row, f1, f2, f3, f4)
  sd = sp.structure_drawings.find_or_create_by(title: row[0], structure_type: nil)
  sd.save!

  sd.attachments.create(attach_type: "Digitised Copy", attachment: f1) if f1
  sd.attachments.create(attach_type: "Photo Copy", attachment: f2) if f2
  sd.attachments.create(attach_type: "Scanned Copy", attachment: f3) if f3
  if f4
    hp = sp.hydralic_particulars.find_or_create_by(title: row[0], hydralic_type: "Structure")
    hp.save!
    hp.attachments.create(attach_type: "Hp Copy", attachment: f4) if f4
  end
end

def import_village(sp, row, f1, f2, f3)
  vm = sp.village_maps.find_or_create_by(village_name: row[0], map_type: "Site Map")
  vm.title = row[0]
  vm.save!

  vm.attachments.create(attach_type: "Digitised Copy", attachment: f1) if f1
  vm.attachments.create(attach_type: "Pdf Copy", attachment: f2) if f2
end

def import_village_maps(sp, row, f1, f2, f3)
  vm = sp.village_maps.find_or_create_by(village_name: row[0], map_type: "Village Map")
  vm.title = row[0]
  vm.save!

  vm.attachments.create(attach_type: "Digitised Copy", attachment: f1) if f1
  vm.attachments.create(attach_type: "Pdf Copy", attachment: f2) if f2
end

def import_custom_menu(sp, row, f)
  if row[0].present?
    cm = sp.custom_menus.create(menu_name: row[0], sub_menu_name: row[1], attachment_type: row[2])
    cm.save!

    cm.attachments.create(attachment: f) if f
  end
end

def file_check(path, file_name)
  if file_name.present?
    if File.exist?("#{path}/#{file_name}")
      return File.new("#{path}/#{file_name}")
    else
      puts "#{path}/#{file_name} not exist"
      return nil
    end
  else
    return nil
  end
  File.new("#{path}/#{row[1]}") if File.exist?("#{path}/#{row[1]}")
end

def import_project_data(proj, folder)
  file = "#{folder}/project.csv"
  if File.exist?(file)
    csv = CSV.parse(File.read(file))
    csv.each do |row|
      if row[0].present? and row[1].present?
        proj.attachments.create(attach_type: row[0], attachment: File.new("#{folder}/#{row[1]}")) if File.exist?("#{folder}/#{row[1]}")
      end
    end
  end
end

def import_data(sub_proj, folder)
  file = "#{folder}/import.csv"
  csv = CSV.parse(File.read(file))
  menu = ""
  path = ""
  csv.each do |row|
    if row[0] == "new menu"
      menu = row[1]
      puts "importing #{sub_proj.name} - #{menu}......"
      next
    end
    path = "#{folder}/#{menu}"
    f1 = file_check(path, row[1]) if row[1].present?
    f2 = file_check(path, row[2]) if row[2].present?
    f3 = file_check(path, row[3]) if row[3].present?
    f4 = file_check(path, row[4]) if row[4].present?
    case menu
      when "bench marks"
        import_bench_marks(sub_proj, row, f1, f2, f3)
      when "hydraulic"
        import_hydraulic(sub_proj, row, f1, f2, f3, f4)
      when "kmwise"
        import_kmwise(sub_proj, row, f1, f2, f3)
      when "structures"
        import_structures(sub_proj, row, f1, f2, f3, f4)
      when "village"
        import_village(sub_proj, row, f1, f2, f3)
      when "village maps"
        import_village_maps(sub_proj, row, f1, f2, f3)
      when "custom menu"
        import_custom_menu(sub_proj, row, f3)
    end
  end
end


# Projects
projects = ["TGP NANDYAL", "SKFF Canal Basemap from Km 0.000 to Km 45.125", "Kandaleru Reservoir Basemap", "SSG Canal Basemap from Km. 0.000 to Km. 151.837"]

# Sub Projects
sub_proj1 = ["Srisailam Right Side Main Canal", "TGP Link Canal-VBR", "TGP Main Canal"]
sub_proj2 = ["SKFF Canal Basemap from Km 0.000 to Km 45.125"]
sub_proj3 = ["Kandaleru Reservoir Basemap"]
sub_proj4 = ["SSG Canal Basemap from Km. 0.000 to Km. 5.435_10.000", "Basemap from Km 10.000 to Km 30.000", "Basemap from Km 30.000 to Km 45.000",
			"Basemap from Km 45.000 to Km 47.100", "Basemap from Km 47.100 to Km 67.500", "Basemap from Km 67.500 to Km 82.500",
			"Basemap from Km 82.500 to Km 112.000", "Basemap from Km 112.000 to Km 120.800", "Basemap from Km 120.800 to Km 142.000",
			"Basemap from Km 142.000 to Km 151.837", "7th Branch Canal Basemap from KM 0.000 TO KM 27.666", "7A AYACUT BASEMAP"]

# Flash file for sub projects
flash_sp1 = ["120.800-142.swf", "120.800-142.swf", "TGP MAIN CANAL.swf"]
flash_sp2 = ["TGP MAIN CANAL.swf"]
flash_sp3 = ["TGP MAIN CANAL.swf"]
flash_sp4 = ["TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf",
			"TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf",
			"TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf",
			"TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf", "TGP MAIN CANAL.swf"]

# Coordinates for sub projects
coord_sp1 = ["SRBC COORDINATES CANAL & STRUCTURES.xls", "LINK CANAL COORDINATES.xls", "KM 0.000 TO KM 95.825-98.305.xls"]
coord_sp2 = ["SKFF COORDINATES CANAL & STRUCTURES.xls"]
coord_sp3 = ["KR DAM FRL COORDINATES.xls"]
coord_sp4 = ["no_file.xls", "points RR 10.xls", "points RR 30.xls",
			"R4 Final 45.000 TO 47.100  COORDINATES.xls", "47.100 TO 67.500 COORDINATES.xls", "RRPOINTS67.xls",
			"82.500 to 112.00.xls", "RRPOINTS112.xls", "RRPOINTS.xls",
			"V4 Final 142.000 TO 151.837 COORDINATES.xls", "0.000 to 27.660.xls", "no_file.xls"]

projects.each_with_index do |p, index|
  project = Project.find_or_create_by(name: p, description: p)
  project.save!
  if File.exist?(@data_url + "#{project.folder_name}")
    path = @data_url + "#{project.folder_name}"
    import_project_data(project, path)
  else
    puts "#{p} folder not exist"
  end
  eval("sub_proj#{index+1}").each_with_index do |sp, ind|
    sub_proj = project.sub_projects.find_or_create_by(name: sp, description: sp)
    sub_proj.save!
    if File.exist?(@data_url + "#{sub_proj.folder_name}")
      puts "."
      xls = eval("coord_sp#{index+1}")[ind]
      import_coordinates(sub_proj, xls) if xls.present?

      flash = eval("flash_sp#{index+1}")[ind]
      import_flash_images(sub_proj, flash) if flash.present?

      path = @data_url + "#{sub_proj.folder_name}"
      if File.exist?("#{path}/import.csv")
        import_data(sub_proj, path)
      end
      # Dir.pwd
      # Dir.chdir(@data_url)
      # Dir.mkdir(sp) unless File.exists?(sp)
    else
      puts "#{sp} folder not exist"
    end
  end
end

