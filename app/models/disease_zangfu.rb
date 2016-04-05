class DiseaseZangfu < ActiveRecord::Base
  belongs_to :disease
  belongs_to :zangfu
end
