class Wiki
  include Mongoid::Document
  belongs_to :repository

  has_many :page
end
