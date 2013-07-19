class Turno < ActiveRecord::Base
validates_presence_of :hora, :nombre
end
