class Disease < ActiveRecord::Base
  has_many :categories, through: :disease_categories
  has_many :disease_categories
  has_many :subindications, through: :disease_subindications
  has_many :disease_subindications

  attr_accessor :indication_id
  attr_accessor :subindication_id

  def self.get_subindication_by_id(id)
    #Disease.find(id).subindications.all
    self.joins(:subindications).where("disease_id = ?", id)
  end

  def self.subindication_name_eng
    test
  end


end
