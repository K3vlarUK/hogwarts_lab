require_relative('../db/sql_runner')

class Student

  attr_accessor :age, :first_name, :last_name, :house
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE students
    SET
    (
      first_name,
      last_name,
      house,
      age
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @house, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM students"
    student_data = SqlRunner.run(sql)
    students = map_items(student_data)
    return students
  end

  def self.map_items(student_data)
    return student_data.map { |student| Student.new(student) }
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    student = Student.new(result)
    return student
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def find_house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house]
    result = SqlRunner.run(sql,values)
    house = result[0]
    return House.new(house)
  end


end
