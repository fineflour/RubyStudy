class Herb < ActiveRecord::Base
  CHANNELS = [ 'LU', 'LI', 'ST', 'SP', 'HT', 'SI', 'UB', 'KD', 'PC', 'SJ', 'GB', 'LV']
  PROPERTIES = ['Sweet' 'Salty', 'Bitter', 'Sour', 'Bland']
  NATURES = ['Warm', 'Hot', 'Cold', 'Cool', 'Neutral']
  has_many :indications, through: :herb_indications
  has_many :herb_indications, :dependent => :destroy
  has_one :categories, :dependent => :destroy
end
