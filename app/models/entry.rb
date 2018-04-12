class Entry < ApplicationRecord
  belongs_to :journal

	validates :title, presence: true
end
