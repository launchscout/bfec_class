class IngredientsController <  InheritedResources::Base
  belongs_to :recipe
  
  respond_to :html, :json
end
