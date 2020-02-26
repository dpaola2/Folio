# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  url        :text
#  archived   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Item < ApplicationRecord
  include Mercury
  after_create :parse!
  validates :url, presence: true

  def parse!
    json = fetch

    update(
      title: json["title"],
      body: json["content"]
    )
  end
end
