class Answer < ActiveRecord::Base

  belongs_to :question
  has_many :votes
  has_many :flags
  validates :text, :presence => true,
                  :length => {:within => 1..130}
  validates_exclusion_of :text, :in => %w(answer), :message => "Write something"

  default_scope :order => 'updated_at DESC'


  cattr_reader :per_page
  @@per_page = 10


end
