# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, presence: true, uniqueness: true

  has_many :contacts, dependent: :destroy

  accepts_nested_attributes_for :contacts, allow_destroy: true

  private

  # Sobrescrevendo o método send_reset_password_instructions do Devise
  # para exibir o template (app/views/user_mailer/reset_password_instructions.html.erb) do email corretamente.
  def send_reset_password_instructions
    token = set_reset_password_token
    UserMailer.reset_password_instructions(self, token).deliver_now
  end
end
