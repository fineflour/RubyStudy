class JavascriptsController < ApplicationController
  def dynamic_subindications
  @subindications = Subindication.all
  end
end
