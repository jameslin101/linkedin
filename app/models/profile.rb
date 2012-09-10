class Profile
  include Mongoid::Document
  
  belongs_to :user
  embeds_many :positions, cascade_callbacks: true
  embeds_many :educations, cascade_callbacks: true
  accepts_nested_attributes_for :positions, :educations
  
  field :linkedinid,         type: Integer
  field :first_name,          type: String
  field :last_name,           type: String
  field :headline,            type: String
  field :location,            type: String
  field :industry,            type: String
  field :summary,             type: String
  field :specialties,         type: String
  field :picture_url,         type: String
  field :public_profile_url,  type: String
  field :email_address,       type: String
    
end
