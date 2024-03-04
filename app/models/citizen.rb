class Citizen < ApplicationRecord
  has_one :address
  has_one_attached :avatar

  accepts_nested_attributes_for :address

  validates :name, :birthdate, :phone, presence: true
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validate :valid_cpf

  scope :search_for, -> (string) do
    s = "%#{string}%"
    where("name ilike ? or phone ilike ? or cns ilike ? or cpf ilike ? or email ilike ?", s, s, s, s, s) if string.present?
  end

  scope :with_initial_date,
    lambda { |date|
      return unless date.present?
      where('birthdate >= ?', date)
    }

  scope :with_end_date,
    lambda { |date|
      return unless date.present?
      where('birthdate <= ?', date)
    }

  scope :with_status,
    lambda { |status|
      return unless status.present?
      where('status = ?', status)
    }

  def active?
    @active ||= status == "active"
  end

  def valid_cpf
    errors.add(:cpf, "deve ser válido") unless CPF.valid?(cpf, strict: true)
  end
end
