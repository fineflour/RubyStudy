class Category < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
has_many :diseases, through: :disease_categories
has_many :disease_categories
#SCOPE  --------------------------------------------------------------
  scope :for_herb, -> { where(type: 'H').order(:name_eng)} 
  scope :for_formular, -> { where(type: 'F').order(:name_eng)} 
  scope :for_disease, -> { where(type: 'D').order(:name_eng)} 
#---------------------------------------------------------------------
end
