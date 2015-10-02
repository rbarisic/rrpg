module RRPG
    class Actor
        def initialize(name, race, level: 1)
            @name = name
            @race = race
            @level = level
        end

        def create
            puts "i got saved #{@name} #{@race}"
        end

        def hello
            puts "Hello, my name is #{@name}!"
        end
    end
end