class Message  <ApplicationRecord
  validates :content, :presence => true

  scope :search, -> (content_parameter) { where("content like ?", "%#{content_parameter}%")}
end
