class Herbalformular < ActiveRecord::Base
  has_many :indications, through: :herbalformular_indications
  has_many :herbalformular_indications, :dependent => :destroy
  has_one :categores, :dependent => :destroy
end
