class User < ApplicationRecord
    validates :username ,:session_token, presence: true, uniqueness: true
    validates :password_digest , presence: { message: 'Password can\'t be blank'}
    validates :password, length: { minimum: 6, allow_nil: true }
    # after_initialize :ensure_session_token # same as below
    before_validation :ensure_session_token

    attr_reader :password
    
    def self.find_by_credentials(username,password)
        user = User.find_by(username: username)


        if user && user.is_password?(password)
            user
        else
            nil
        end
    end
    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        # user = User.where(
        #     username: username,
        #     password: password
        # ).first
        self.session_token = User.generate_session_token
        self.save! # user.save!
        self.session_token # session[:session_token] = user.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
        # self.session_token ||= SecureRandom::urlsafe_base64
    end
    def Password=(password)
       self.password_digest = BCrypt::Password.create(password)
       @Password = password
    end

end
