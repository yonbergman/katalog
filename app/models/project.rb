class Project < ActiveRecord::Base

  DEFAULT_IMAGE = 'http://placehold.it/200x150'

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :users
  has_many :posts

  enum :status, [:idea, :wip, :done, :dead]

  scope :latest_first, -> { order(:updated_at => :desc) }
  scope :search, lambda {|query| where('lower(title) like ?', query.downcase + '%')}

  def to_param
    slug
  end

  def image
    DEFAULT_IMAGE
  end

  def less_than_week_old?
    self.created_at > 1.week.ago
  end

  private

  def slug
    "#{id}-#{title.parameterize}"
  end

end