class Education
  include Mongoid::Document
  
  embedded_in :profile
  
  field :linkedin_id,       type: Integer
  field :school_name,       type: String
  field :field_of_study,    type: String
  field :degree,            type: String
  field :activities,        type: String
  field :notes,             type: String
  field :start_date,        type: Date
  field :end_date,          type: Date
  
  
end
