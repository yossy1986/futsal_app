class Room < ApplicationRecord
    has_many :messages
    has_many :chat_links
end
