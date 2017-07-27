class Cart

  def initialize(content)
    @content = content
  end

  def total_price
    find_by_course_id.reduce(0) { |sum, course| sum + (course.price * @content[course.id.to_s]) }
  end

  def find_by_course_id
    @content.keys.map { |course| Course.find(course.to_i) }
  end


end
