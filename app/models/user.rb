class User < ActiveRecord::Base
attr_accessible(:name, :email, :oassword, :password_confirmation)

validates(:name,presence: true, length: {maximum: 10})
validates :email, presence: true
end
