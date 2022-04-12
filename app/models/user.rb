class User < ActiveRecord::Base

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user.authenticate(password)
      user
    else
      nil
    end
  end
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 5}
  
end
