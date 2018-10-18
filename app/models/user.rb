class User < ActiveRecord::Base
has_secure_password
validates :email, 'valid_email_2/email': { mx: true, disposable: true}
has_many :programs
end
