class HerbIndication < ActiveRecord::Base
  belongs_to :herb
  belongs_to :indication
end
