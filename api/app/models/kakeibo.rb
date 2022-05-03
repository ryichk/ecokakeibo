class Kakeibo < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :month, presence: true
  before_save :env_create
  before_create :envload_create


  def env_create
    self.denki_env = self.denki.to_f * 0.43
    self.gas_env = self.gas.to_f * 2.24
    self.suidou_env = self.suidou.to_f * 0.36
  end

  def envload_create
    self.env_load = self.denki_env + self.gas_env + self.suidou_env
  end



end
