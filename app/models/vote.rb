class Vote < ActiveRecord::Base

belongs_to :answer

default_scope :order => 'updated_at DESC'

attr_accessible :answer_id


end
