class User < ActiveRecord::Base
  has_secure_password


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true


  # is this working??
  # make it not case sensitive
  validates_uniqueness_of :email

  validates :password, length: { minimum: 3 }

  #is this working??
  # this is a class method right?
  def self.authenticate_with_credentials(email, password)
    # user = User.find_by_email(/#{email}/i)
    puts "EMAIL"
    puts email
    user = User.find_by email: email
    puts user.inspect
    if (user && user.authenticate(password))
      return user
    else
      return nil
    end
  end
end
