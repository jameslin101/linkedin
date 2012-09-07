class Experience
  include Mongoid::Document
        
  field :company,  type: String 
  field :title, type: String
  field :dates, type: String
  field :location, type: String
  field :description, type: String
  
end
