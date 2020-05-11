class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String

  validates :name, length: { maximum: 10 }

  belongs_to :shop

end
