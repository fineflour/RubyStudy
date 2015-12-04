class DiseaseSubindication < ActiveRecord::Base
  belongs_to :disease
  belongs_to :subindication

  validates_uniqueness_of :disease_id, scope: [:subindication_id], :message =>'Only One'
end
