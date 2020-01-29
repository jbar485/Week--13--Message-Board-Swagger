class Message  <ApplicationRecord
  belongs_to :group
  validates :content, :presence => true

  scope :search, -> (content_parameter) { where("content like ?", "%#{content_parameter}%")}
end
