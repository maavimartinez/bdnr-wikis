class User
  include Mongoid::Document
  field :username, type: String
  field :email, type: String
  field :password, type: String

  has_many :repository
end
