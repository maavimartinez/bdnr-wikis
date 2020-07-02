class Repository
  include Mongoid::Document
  field :name, type: String
  
  has_one :wiki
  belongs_to :user
end
