class Lawn < ApplicationRecord
  def self.owner
    Lawn.last.name
  end
end
