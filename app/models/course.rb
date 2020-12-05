class Course < ApplicationRecord
  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { :minimum => 5 }

  belongs_to :user
  has_many :lessons, dependent: :destroy

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user rescue nil }

  def to_s
    title
  end

  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Generate random slug on create

  #friendly_id :generate_slug, use: :slugged
  #def generate_slug
  #  require 'securerandom'
  #  @random_slug ||= persisted? ? friendly_id: SecureRandom.hex(4)
  #end

  LANGUAGES = [:"English", :"Portuguese", :"Spanish"]
  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map { |level| [level, level] }
  end
end
