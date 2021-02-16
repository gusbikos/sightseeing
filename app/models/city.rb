class City < ActiveRecord::Base
# add associatons!

    has_many :neighborhoods 
    
end
