class Automaton
  def initialize
    # set up states
  end
  
  def read_commands(commands)
    # return true if it ends up on the accepted state
    pointer = 'q1'
    p commands
    commands.each do |command|
      if command === '1'
        if pointer === 'q1'
          pointer = 'q2'
        elsif pointer === 'q2'
          pointer = 'q2'
        elsif pointer === 'q3'
          pointer = 'q2'
        end
      elsif command === '0'
        if pointer === 'q1'
          pointer = 'q1'
        elsif pointer === 'q3'
          pointer = 'q2'  
        elsif pointer === 'q2'
          pointer = 'q3'      
        end
      end
    end
    return pointer === 'q2' ? true : false
  end
end

my_automaton = Automaton.new
Test.assert_equals(my_automaton.read_commands(["1"]), true)

my_automaton = Automaton.new
Test.assert_equals(my_automaton.read_commands(["1", "0", "0", "1"]), true)