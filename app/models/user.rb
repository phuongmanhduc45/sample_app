class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name, presence: true, length: Settings.name_length_maximum

  VALID_EMAIL_REGEX = Settings.email_valid_regex
  validates :email,
    presence: true, length: Settings.email_length_maximum,
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, presence: true, length: Settings.password_length_minimum
end
