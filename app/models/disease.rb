class Disease < ActiveRecord::Base
  has_many :categories, through: :disease_categories
  has_many :disease_categories
  has_many :subindications, through: :disease_subindications
  has_many :disease_subindications

  has_many :zangfus, through: :disease_zangfus
  has_many :disease_zangfus, :dependent => :destroy


  #accepts_nested_attributes_for :disease_categories
  accepts_nested_attributes_for :disease_subindications

  validates_presence_of :categories

  attr_accessor :indication_id
  attr_accessor :subindication_id

  
end
