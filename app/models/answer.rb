class Answer < ActiveRecord::Base

  belongs_to :question


  validates :text, :presence => true,
                  :length => {:within => 1..130}
end
