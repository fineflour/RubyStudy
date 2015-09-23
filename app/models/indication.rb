class Indication < ActiveRecord::Base
  has_many :points, through: :point_indications
  has_many :point_indications

  validates :name_eng, presence: true

  scope :active, -> { where active: true }

  def self.order_by_name_eng
    Indication.select('name_eng').order(name_eng: :asc)
  end

  def self.order_by_name_ko
    Indication.order(name_ko: :asc)
  end


end
