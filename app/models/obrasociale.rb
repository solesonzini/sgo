class Obrasociale < ActiveRecord::Base
has_many :personas
 validates_presence_of :nombre
end
