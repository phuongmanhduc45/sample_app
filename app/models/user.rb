class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.email_valid_regex

  before_save {email.downcase!}
  has_secure_password

  validates :name, presence: true,
    length: Settings.name_length_maximum
  validates :email,
    presence: true, length: Settings.email_length_maximum,
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: Settings.password_length_minimum
end
