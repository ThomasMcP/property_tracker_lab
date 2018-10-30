require('pg')
require('pry-byebug')

attr_accessors :address, :value, :number_of_bedrooms, :year_built, :status, :sq_foot, :build_type

class Property

  def initialize(options)
    @address = options['address']
    @value = options['value'].to_i
    @number_of_bedrooms = options['number_of_bedrooms'].to_i
    @year_built = options['year_built'].to_i
    @status = options['status']
    @sq_metres = options['sq_metres'].to_i
    @build_type = options['build_type']
  end

  def create()
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "INSERT INTO property_tracker (
    address,
    value,
    number_of_bedrooms,
    year_built,
    status,
    sq_metres,
    build_type
    ) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *"
    

  end

end
