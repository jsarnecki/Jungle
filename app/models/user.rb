class User < ActiveRecord::Base

  has_secure_password

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user.authenticate(password)
      user
    else
      nil
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: {minimum: 5}
  
end
