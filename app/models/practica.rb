class Practica < ActiveRecord::Base
 belongs_to :hclinica
validates_presence_of :nombre, :codpractica
end
