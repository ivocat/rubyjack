require_relative 'interface'
require_relative 'house'

house = House.new
interface = Interface.new(house)

interface.execute
