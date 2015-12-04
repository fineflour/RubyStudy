class DiseaseCategory < ActiveRecord::Base
  belongs_to :disease
  belongs_to :category
end
