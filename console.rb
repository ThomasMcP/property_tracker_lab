require_relative('model/property_tracker.rb')
require('pry-byebug')

property1 = Property.new ({
  'address' => '30/1 Fettes Row',
  'value' => '240000',
  'number_of_bedrooms' => '2',
  'year_built' => '1983',
  'status' => 'to let',
  'sq_metres' => '60',
  'build_type' => 'flat'
  })

property2 = Property.new ({
  'address' => '30/2 Fettes Row',
  'value' => '250000',
  'number_of_bedrooms' => '2',
  'year_built' => '1983',
  'status' => 'Occupied',
  'sq_metres' => '68',
  'build_type' => 'flat'
  })

property1.create
property2.create
properties = Property.read()
p properties
