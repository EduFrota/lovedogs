class User < ApplicationRecord
  include PgSearch::Model
  include Filterable

  mount_uploader :image, ImageUploader

  has_many :dogs, dependent: :delete_all
  has_many :favorites, dependent: :delete_all

  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable, :omniauthable

  pg_search_scope :by_name, against: [:name]
  scope :state, -> (state) { where state: state }
  scope :city, -> (city) { where city: city }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.facebook_image = auth.info.image
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  STATES = [
    'Acre (AC)',
    'Alagoas (AL)',
    'Amapá (AP)',
    'Amazonas (AM)',
    'Bahia (BA)',
    'Ceará (CE)',
    'Distrito Federal (DF)',
    'Espírito Santo (ES)',
    'Goiás (GO)',
    'Maranhão (MA)',
    'Mato Grosso (MT)',
    'Mato Grosso do Sul (MS)',
    'Minas Gerais (MG)',
    'Pará (PA)',
    'Paraíba (PB)',
    'Paraná (PR)',
    'Pernambuco (PE)',
    'Piauí (PI)',
    'Rio de Janeiro (RJ)',
    'Rio Grande do Norte (RN)',
    'Rio Grande do Sul (RS)',
    'Rondônia (RO)',
    'Roraima (RR)',
    'Santa Catarina (SC)',
    'São Paulo (SP)',
    'Sergipe (SE)',
    'Tocantins (TO)'
  ] # Fonte: https://www.sogeografia.com.br/Conteudos/Estados/
end
