class Student < ApplicationRecord
    # ensures that the name is within 50 characters.
    validates(:name, presence: true, length: { maximum: 50})
    # ensures email within 255 characters with valid format.
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX }

end
