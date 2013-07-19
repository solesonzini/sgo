class Persona < ActiveRecord::Base
 has_many :hclinicas
 has_many :obrasociales
 validates_presence_of :nombre, :apellido, :dni, :fechanac, :edad, :sexo, :direccion, :telefono, :tipo,:obrasoc, :estadocivil,:numafiliado,:ocupacion,:nommedico
end
