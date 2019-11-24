# per: https://stackoverflow.com/questions/34697634/same-model-for-two-belongs-to-associations-migration/34697712

class Friend < ApplicationRecord
  belongs_to :player_one, class_name: "Player", foreign_key: "player_one_id"
  belongs_to :player_two, class_name: "Player", foreign_key: "player_two_id"
end
