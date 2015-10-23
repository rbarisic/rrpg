module RRPG
        
    module Model
        class Game < RRPG::Model::JSON
            attr_accessor :attrs

            def initialize(name: 'Untitled')
                super
                @attrs = {}
                @attrs['name'] = name
                puts "Game JSON Model loaded. #{@attrs['name']}"
            end

            def save

            end
        end
    end
end