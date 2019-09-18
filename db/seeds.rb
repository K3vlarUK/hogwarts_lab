require_relative('../models/student')
require_relative('../models/house')

house1 = House.new({
  'house' => 'Gryffindor'
  })

house2 = House.new({
  'house' => 'Ravenclaw'
  })

house3 = House.new({
  'house' => 'Hufflepuff'
  })

house4 = House.new({
  'house' => 'Slytherin'
  })

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  'first_name' => 'hermione',
  'last_name' => 'granger',
  'house' => house1.id(),
  'age' => 12 })
student2 = Student.new({
  'first_name' => 'owen',
  'last_name' => 'cauldwell',
  'house' => house2.id(),
  'age' => 13 })
student3 = Student.new({
  'first_name' => 'roger',
  'last_name' => 'davies',
  'house' => house3.id(),
  'age' => 14 })
student4 = Student.new({
  'first_name' => 'severus',
  'last_name' => 'snape',
  'house' => house4.id(),
  'age' => 37 })

student1.save
student2.save
student3.save
student4.save
