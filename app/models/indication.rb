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


end
