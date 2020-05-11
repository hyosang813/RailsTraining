class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # field :name, type: String
  # field :message, type: String
  # field :age, type: Integer

  field :user_id, type: String
  field :password, type: String

  # has_many :article

  has_many :working_hour

  # おそらくここにアイパスのログイン可否メソッドが必要？
end
