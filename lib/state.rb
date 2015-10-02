module Editor
    class State
        include Observable
        attr_reader :name
        attr_accessor :entities

        # Create the State via a YAML File
        def initialize(window, entities: [])
            self.add_observer(window, func = :state_update)

            # @entities = build_entities(entities)
            @entities = entities
            puts "A state has been created. #{self}"
        end

        def button_down(id)
            if @entities.count > 0
                @entities.each do |e|
                    e.button_down(id)
                end
            end
        end

        def update
            if @entities.count > 0
                @entities.each do |e|
                    e.update
                end
            end
        end

        def draw
            if @entities.count > 0
                @entities.each do |e|
                    e.draw
                end
            end
        end

        def change_state(state) # move this to window maybe?
            changed
            notify_observers(next_state: state)
        end

        def last_state
            changed
            notify_observers(go_back: true)
        end
    end
end

# require_all('./states')