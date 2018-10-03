class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :chat_links, dependent: :destroy
    belongs_to :match_req
end
