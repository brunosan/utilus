class Answer < ActiveRecord::Base

  belongs_to :question


  validates :text, :presence => true,
                  :length => {:within => 1..130}

default_scope :order => 'updated_at DESC'


  cattr_reader :per_page
  @@per_page = 10



end
