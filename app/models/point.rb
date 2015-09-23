class Point < ActiveRecord::Base
  has_many :indications, through: :point_indications
  has_many :point_indications, :dependent => :destroy
  accepts_nested_attributes_for :point_indications

  validates :name_eng, :name_ko, presence:true
end
