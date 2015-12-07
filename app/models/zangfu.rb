class Zangfu < ActiveRecord::Base
has_many :indications, :through => :zangfu_indications
has_many :zangfu_indications


has_many :subindications, :through => :zangfu_subindications
has_many :zangfu_subindications

has_many :diseases, :through => :disease_zangfus
has_many :diesase_zangfus, :dependent => :destroy




#SCOPE  --------------------------------------------------------------
  scope :channel, -> { order(:order)} 
#---------------------------------------------------------------------
end
