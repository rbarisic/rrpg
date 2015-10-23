module RRPG
        
    class Camera
        attr_accessor :x, :y, :z, :focus, :offset_x, :offset_y

        def initialize(viewport_width, viewport_height)
            @x = 0
            @y = 0
            @speed = 1
            @viewport_width = viewport_width
            @viewport_height = viewport_height

            @offset_x = @viewport_width / 2
            @offset_y = @viewport_height / 2

            @focus = nil
        end

        # Which entity the camera should focus
        def focus=(entity)
            puts "this is ENTITONY #{entity}"
            @focus = entity
        end

        def update
            if  @x > @focus.x

                @x -= (Math.sqrt((@x - @focus.x) * (@x - @focus.x)) / 10).floor

            elsif @x < @focus.x

                @x += (Math.sqrt((@x - @focus.x) * (@x - @focus.x)) / 10).floor
            end

            if @y > @focus.y

                @y -= (Math.sqrt((@y - @focus.y) * (@y - @focus.y)) / 10).floor

            elsif @y < @focus.y

                @y += (Math.sqrt((@y - @focus.y) * (@y - @focus.y)) / 10).floor
            end
        end
    end
end