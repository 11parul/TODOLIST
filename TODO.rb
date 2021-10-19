require "date"

class Todo                         #first letter of class is always taken as capital
 
  def initialize(txt, dd, comp)    #initialize method acts like constructor
    @txt= txt                      #@ is used to indicate instance variables
    @dd = dd                       #txt is text,dd is due date and comp is completed
    @comp = comp
  end                              #end of initialize method
  def due_date                     #getter
    @dd
  end
  def overdue?                     #getter
    @dd < Date.today
  end
  def to_displayable_string        #getter
    status = @comp ? "[x]" : "[ ]" #setting the status of completed task as [x]
    if date = @dd == Date.today ? nil : @dd 
    end 
    puts "#{status} #{@txt} #{date}"
  end
end

class TodosList
  def initialize(todos)
    @todos = todos
  end
  def overdue
    TodosList.new(@todos.filter { |todo| todo.overdue? })
  end
  def due_today
    TodosList.new(@todos.filter { |todo| todo.due_date == Date.today })
  end
  def due_later
    TodosList.new(@todos.filter { |todo| todo.due_date > Date.today })
  end
  def add(t)               
    @todos.push(t)        #push function is used to add todo to the end of array
  end
  def to_displayable_list
    @todos.map { |todo| todo.to_displayable_string }
  end
end

date = Date.today
todos = [
  { text: "Submit assignment", due_date: date - 1, completed: false },
  { text: "Pay rent", due_date: date, completed: true },
  { text: "File taxes", due_date: date + 1, completed: false },
  { text: "Call Acme Corp.", due_date: date + 1, completed: false },
]

todos = todos.map { |todo|
  Todo.new(todo[:text], todo[:due_date], todo[:completed])
}

todos_list = TodosList.new(todos)

todos_list.add(Todo.new("Service vehicle", date, false))

puts "My Todo-list\n\n"

puts "Overdue\n"
puts todos_list.overdue.to_displayable_list
puts "\n\n"

puts "Due Today\n"
puts todos_list.due_today.to_displayable_list
puts "\n\n"

puts "Due Later\n"
puts todos_list.due_later.to_displayable_list
puts "\n\n"