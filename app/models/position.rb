class Position
  include Mongoid::Document

  embedded_in :profile

  has_one :company

  field :linkedinid,       type: Integer
  field :is_current,        type: Boolean
  field :summary,           type: String
  field :title,             type: String
  field :start_date,        type: Date
  field :end_date,          type: Date
  
end
