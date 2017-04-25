class Indication < ActiveRecord::Base

  has_many :points, through: :point_indications
  has_many :point_indications
  has_many :herbs, through: :herb_indications
  has_many :herb_indications
  has_many :herbalformulars, through: :herbalformuar_indications
  has_many :herbalformular_indications

  has_many :zangfus, through: :zangfu_indications
  has_many :zangfu_indications, :dependent => :destroy
  has_many :subindications, :through => :indication_subindications
  has_many :indication_subindications
  validates :name_eng, presence: true
  accepts_nested_attributes_for :zangfu_indications
  accepts_nested_attributes_for :indication_subindications
  scope :active, -> { where active: true }

  def self.order_by_name_eng
    Indication.select('name_eng').order(name_eng: :asc)
  end

  def self.order_by_name_ko
    Indication.order(name_ko: :asc)
  end

  def self.get_subindications_by_id(indication_id)
    Subindication.joins(:indications).where("indication_id = ?", indication_id)
  end

  def self.get_indications_by_sub_id(subindication_id)
    self.joins(:subindications).where("subindication_id = ?", subindication_id)
  end


  def self.import(file)
    n=0
    u=0
    CSV.foreach(file.path, headers: true, col_sep: '|') do |row|
      if row[0].nil?
        puts "Adding new Indication: #{row[1]}"
        indication = Indication.new()

        n += 1
      else

        next if row[0].downcase == "id"
        puts "Updating indication: #{row[1]}"
        indication = Indication.find(row[0])

        u += 1
      end
        indication.name_eng =row["name_eng"]
        indication.name_ko = row["name_ko"]
        indication.description = row["description"]
#        binding.pry
        indication.save
      end
      #Indication.create! row.to_hash
    puts ""
    puts "Import Completed - Added: #{n} | Updated #{u} Indications"
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.save_import(array, filename)
    array.each do |row|
      self.create(name: row.name,
                  name_eng: row.name_eng,
                  description: row.description)
#                  zangfu_ids: row.zangfu_id)
    end
  end
end
