class Category < ActiveRecord::Base
has_many :diseases, through: :disease_categories
has_many :disease_categories
#SCOPE  --------------------------------------------------------------
  scope :for_herb, -> { where(category: 'H').order(:name_eng)} 
  scope :for_formular, -> { where(category: 'F').order(:name_eng)} 
  scope :for_disease, -> { where(category: 'D').order(:name_eng)} 
#---------------------------------------------------------------------
end
