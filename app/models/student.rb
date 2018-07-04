class Student < ApplicationRecord
    attr_accessor :remember_token
    
    before_save { self.email = email.downcase }
    # ensures that the name is within 50 characters.
    validates(:name, presence: true, length: { maximum: 50})
    # ensures email within 255 characters with valid format.
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    class << self
        # Returns the hash digest of the given string.
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                          BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
        end
        
        # Returns a random token.
        def new_token
            SecureRandom.urlsafe_base64
        end
    end
    
    def remember
        self.remember_token = Student.new_token
        update_attribute(:remember_digest, Student.digest(remember_token))
    end
    
    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    # Forgets a student.
    def forget
        update_attribute(:remember_digest, nil)
    end
    
end