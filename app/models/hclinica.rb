class Hclinica < ActiveRecord::Base
   belongs_to :persona
   has_many :practicas
validates_presence_of :codprac, :dientese, :dientesf, :totaltemp, :totalperma, :dientecolor
end
