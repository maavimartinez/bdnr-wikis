class Page
  include Mongoid::Document
  field :title, type: String
  field :last_modification_date, type: DateTime
  field :content, type: String
  field :message, type: String
  field :history, type: Array

  has_one :user
  belongs_to :wiki
  embeds_many :pages, :class_name => Page.to_s, :store_as => :array
end
