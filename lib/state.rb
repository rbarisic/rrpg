module RRPG
    class State
        include Observable
        attr_reader :name
        attr_accessor :entities, :cam

        # Create the State via a YAML File
        def initialize(window, entities: [])
            self.add_observer(window, func = :state_update)
            @entities = entities
            @cam = Camera.new(window.width, window.height)
            puts "A state has been created. #{self}"
        end

        def button_down(id)
            if @entities.count > 0
                @entities.each do |e|
                    e.button_down(id)
                end
            end
            case id
                when Gosu::KbA
                    @cam.x -= 20
                when Gosu::KbD
                    @cam.x += 20
                when Gosu::KbW
                    @cam.y -= 20
                when Gosu::KbS
                    @cam.y += 20
            end
                
        end
        
        def button_up(id)
            if @entities.count > 0
                @entities.each do |e|
                    e.button_up(id)
                end
            end
        end

        def update
            @cam.update
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

        def add_entity(entity)
            entity.parent = self
            @entities.push entity
        end
    end
end