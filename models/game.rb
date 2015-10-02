module Editor
    module Model
        class Game < Editor::Model::JSON
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