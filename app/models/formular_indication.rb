class FormularIndication < ActiveRecord::Base
  belongs_to :herbformular
  belongs_to :indication
  
end
