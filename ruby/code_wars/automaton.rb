class Automaton
  def initialize
    # set up states
  end
  
  def read_commands(commands)
    pointer = 'q1'
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


# リファクタリング
class Automaton
  def initialize
    @states = {
      "q1" => { "0" => "q1", "1" => "q2" },
      "q2" => { "0" => "q3", "1" => "q2" },
      "q3" => { "0" => "q2", "1" => "q2" }
    }
  end
  
  def read_commands(commands)
    state = "q1"
    
    commands.each do |command|
      state = @states[state][command]
    end
    
    state == "q2"
  end
end


class Automaton
  def initialize
    @state = :q1
  end
  
  def read_commands(commands)
    commands.each do |command|  
      case @state
      when :q1
        @state = command == '1' ? :q2 : :q1
      when :q2
        @state = command == '1' ? :q2 : :q3
      when :q3
        @state = :q2
      end
    end
    
    @state == :q2
  end
end


class Automaton
  def read_commands(w)
    !!(/^0*1(1|0.)*$/ =~ w.join)
  end
end