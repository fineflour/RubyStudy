class PointIndication < ActiveRecord::Base
  belongs_to :point
  belongs_to :indication
end
