class Company
  include Mongoid::Document

  belongs_to :position

  field :linkedinid,   type: Integer
  field :industry,      type: String
  field :name,          type: String
  field :size,          type: String
  field :type,          type: String


end