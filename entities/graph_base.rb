module RRPG
        
    module Entity
        class GraphBase
            include RRPG::Entity::EntityBase
            attr_accessor :x, :y, :z

            def initialize(x, y, z)
                @x_start = x
                @y_start = y
                @z_start = z
                @x = @x_start
                @y = @y_start
                @z = @z_start
                pre # call pre actions
            end

            def button_down(id)
                
            end

            def button_up(id)

            end

            def update

            end

            def draw

            end

            def pre
                puts "New #{self.class} created."
            end

            def animate

            end
        end
    end
end