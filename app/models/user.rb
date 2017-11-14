class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token

  before_create :create_activation_digest

  validates :name, presence: true, length: { minimum: 4, maximum: 8 }

  validates :setai, presence: true, length: { minimum: 1, maximum: 2 }, numericality: { greater_than_or_equal_to: 1}
  has_secure_password
  validates :password, presence: true, length: { minimum: 4, maximum: 8 }, allow_nil: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]

  has_many :kakeibos, dependent: :destroy
  has_many :meals, dependent: :destroy

  #与えられた文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #永続的セッションで使用するユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  #ユーザーログインを破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  #アカウントを有効にする
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  #パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  #パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

    private

      #有効化トークンとダイジェストを作成及び代入する
      def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
      end

end
