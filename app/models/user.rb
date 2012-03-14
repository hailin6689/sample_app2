class User < ActiveRecord::Base
attr_accessible(:name, :email, :password, :password_confirmation)
has_secure_password
has_many :microposts, dependent: :destroy

validates(:name,presence: true, length: {maximum: 10})
validates :email, presence: true
validates :password, length: {minimum: 6}
validates :password_confirmation, presence: true
end
