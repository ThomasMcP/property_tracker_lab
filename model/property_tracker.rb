require('pg')
require('pry-byebug')

class Property

attr_accessor :address, :value, :number_of_bedrooms, :year_built, :status, :sq_foot, :build_type

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
    ) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *;"
    values = [@address, @value, @number_of_bedrooms, @year_built, @status, @sq_metres, @build_type]

    db.prepare("create", sql)
    db.exec_prepared("create", values)
    db.close
  end

  def Property.read()
    db = PG.connect({
      dbname: 'property_tracker', host: 'localhost'
      })
    sql = "SELECT * FROM property_tracker;"
    db.prepare("read", sql)
    properties_hashes = db.exec_prepared("read")
    db.close()
    return properties_hashes.map { |property_hash|
      Property.new(property_hash)
    }
  end

  def update()
    db = PG.connect({
      dbname: 'property_tracker', host: 'localhost'
      })
    sql = "UPDATE property_tracker SET status = $1 WHERE id = $2;"
    values = [@status, @id]
    db.prepare
  end


end
