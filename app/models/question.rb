class Question < ActiveRecord::Base

has_many :answers, :dependent => :destroy

validates :title, :presence => true,
                  :length => {:within => 1..130}
  
default_scope :order => 'updated_at DESC'

cattr_reader :per_page
  @@per_page = 10


end
