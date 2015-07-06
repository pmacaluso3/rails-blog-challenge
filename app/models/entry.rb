class Entry < ActiveRecord::Base
  validates :title, uniqueness: true

end
