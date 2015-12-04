class IndicationSubindication < ActiveRecord::Base
  belongs_to :indication
  belongs_to :subindication

end
