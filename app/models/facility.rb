class Facility < ApplicationRecord
    
    def court
        Facility.find_by(id: self.facility)
    end
    def prefecture
        Pref.find_by(id: self.pref)
    end
end
