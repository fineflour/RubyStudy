class Disease < ActiveRecord::Base
  has_many :categories, through: :disease_categories
  has_many :disease_categories
  has_many :subindications, through: :disease_subindications
  has_many :disease_subindications

  attr_accessor :indication
  def self.get_subindications_by_id(disease_id)
    Subindication.joins(:disease).where("disease_id = ?", disease_id)
  end

  def self.get_subindication_by_id(id)
    self.joins(:subindications).where("disease_id = ?", id)
  end


end
