class Subindication < ActiveRecord::Base
  has_many :indications, :through => :indication_subindications
  has_many :indication_subindications, :dependent => :destroy
  has_many :indication_subindications

  has_many :diseases, :through => :disease_subindications
  has_many :disease_subindications, :dependent => :destroy
  has_many :disease_subindications

  has_many :zangfus, through: :zangfu_subindications
  has_many :zangfu_subindications, :dependent => :destroy


  accepts_nested_attributes_for :indication_subindications
  validates :name_eng, presence: true
  ###Scope-------------------------------
  scope :by_indication, -> (indication_id) { joins(:indications).where("indication_id=?", indication_id)}
  scope :by_disease, -> (disease_id) { joins(:diseases).where("disease_id=?", disease_id)}
  #--------------------------------------
 
end
