class Repository
  include Mongoid::Document
  field :name, type: String
  
  has_one :wiki
  has_and_belongs_to_many :users
end
