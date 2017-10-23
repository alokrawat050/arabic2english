module Arabic2english
    #input_num as a parameter, and return value in words.
    def self.arabic2english(input_num)
      #set the hash for the number convert into words.
      #here i checked only for 3 digit.
      numbers_to_words = {
          100 => "hundred", 90 => "ninety", 80 => "eighty", 70 => "seventy", 60 => "sixty", 50 => "fifty", 40 => "forty", 30 => "thirty", 20 => "twenty",
          19=>"nineteen", 18=>"eighteen", 17=>"seventeen", 16=>"sixteen", 15=>"fifteen", 14=>"fourteen", 13=>"thirteen", 12=>"twelve", 11 => "eleven", 10 => "ten",
          9 => "nine", 8 => "eight", 7 => "seven", 6 => "six", 5 => "five", 4 => "four", 3 => "three", 2 => "two", 1 => "one"
        }
    
       #set the return value in str variable.
        str = ""
      
       #check for the input value is numeric or not.
       #if not numeric then display a error message otherwise display the entered value in words.
        fail 'Must be a numeric value!' if input_num.to_s.strip.empty?
        value = input_num.to_s unless input_num.instance_of? String
        fail 'Must be a numeric value!' if input_num.to_s.match(/^[0-9]*$/).nil?
        value = value.to_i
        fail 'Must be only 3 digits.' if value.to_s.length > 3
        numbers_to_words.each do |num, name|
            if value == 0
                return str
            elsif value.to_s.length == 1 && value/num > 0
                return (str + "#{name}").strip
            elsif value < 100 && value/num > 0
                return str + "#{name}" if value%num == 0
                return (str + "#{name} " + arabic2english(value%num)).strip
            elsif value/num > 0
                return (str + arabic2english(value/num) + " #{name} " + arabic2english(value%num)).strip
            end
        end
    end
    
    #by using gem 'to_words'
    #input_num as a parameter, and return value in words.
    def self.arabic2english_by_gem(input_num)
        value = Integer(input_num) rescue false 
        if value
          #here i checked only for 999 numbers
            if value.to_s.length <= 3 
              return input_num.to_words
            else
              #display message, if user entered more than 4 numbers
                return "Must be only 3 digits."
            end 
        else
            return "Must be a numeric value!"
        end
    end
    
    private
        def invalid?(num)
            num.match(/^[0-9]*$/).nil?
        end
end
