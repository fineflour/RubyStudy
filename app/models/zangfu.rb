class Zangfu < ActiveRecord::Base
has_many :indications, :through => :zangfu_indications
has_many :zangfu_indications


has_many :subindications, :through => :zangfu_subindications
has_many :zangfu_subindications

#SCOPE  --------------------------------------------------------------
  scope :channel, -> { order(:order)} 
#---------------------------------------------------------------------
end
