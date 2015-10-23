module RRPG
        
    module Entity
        class Widget
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
                # animation = Animation(:fly_in_from_left) <-- something like this would be awesome
            end

            def button_down(id)
                
            end

            def button_up(id)

            end
            
            def update
                 # animate(self) if @animation #...*hint hint*
                # animate
            end

            def draw

            end

            def pre
                # @x = -$wwidth / 2
                # @y = -200
                puts "New #{self.class} created."
            end

            # def animate
            #     unless @x == @x_start
            #         @x += Math.sqrt( (@x_start - @x) * (@x_start - @x) / 10 )
            #     end

            #     # unless @y == @y_start
            #     #     @y += Math.sqrt( (@y_start - @y) * (@y_start - @y) / 10 )
            #     # end
            # end
        end
    end
end