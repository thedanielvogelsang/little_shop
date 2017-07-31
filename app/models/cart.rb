class Cart
  attr_reader :content

  def initialize(initial_content)
    @content = initial_content || {}
  end

  def total_price
    find_by_course_id.reduce(0) do |sum, course|
      sum + (course.price * @content[course.id.to_s])
    end
  end

  def find_by_course_id
    ids = content.keys
    Course.where(id: ids)
  end

  def add_course(id)
    content[id.to_s] = (content[id.to_s] || 0) + 1
  end

  def subtract_course(id)
    content[id.to_s] = content[id.to_s] - 1
  end
end
