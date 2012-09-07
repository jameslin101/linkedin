class LinkedinProfile
  include Mongoid::Document
  
  embeds_many :experiences
  
  field :url, type: String
  field :name,  type: String 
  field :title, type: String
  field :area, type: String
  field :field, type: String
  
  
  
end
