class Zangfu < ActiveRecord::Base
has_many :indications, :through => :zangfu_indications
has_many :zangfu_indications
end
