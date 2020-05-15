class User
  include Mongoid::Document
  include Mongoid::Timestamps
  # include ActiveModel::SecurePassword # (ハッシュ化による)セキュアなパスワードを使う

  field :name
  field :email
  field :password
  field :password_confirmation

  before_save { self.email = email.downcase }

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }

  def formatted_email
    "#{name} <#{email}>"
  end

  # 自前でパスワードチェックメソッド作ったるわ
  def authenticate(password)
    return self.password == password
  end
  
  # (ハッシュ化による)セキュアなパスワードを使う なんかハマったから一旦スルー
  # has_secure_password
end
