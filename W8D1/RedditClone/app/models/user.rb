class User < ApplicationRecord
    validates :username , presence: true , uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest , presence: true
    validates :password ,length: {minimum: 6} , allow_nil: true

    attr_reader :password
    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password)

    end

    def password=(password)
    end

    def is_password?(password)
    end

    def reset_session_token!
    end

    def ensure_session_token
    end

end
