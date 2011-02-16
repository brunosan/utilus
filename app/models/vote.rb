class Vote < ActiveRecord::Base

belongs_to :answer

default_scope :order => 'updated_at DESC'



end
