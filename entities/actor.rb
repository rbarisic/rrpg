module RRPG
        
    module Entity
        class Actor < Entity::GraphBase
            include Animatable
            attr_accessor :x, :y
            attr_reader :parent, :height, :width

            def initialize(name, x, y, z, charsheet: nil, parent: nil)
                puts "OH PARENTO ISSU NIL-U!!!".colorize(:yellow) if parent == nil
                @name = name
                @solid = true
                @parent = parent
                @image = Gosu::Image.new('./data/charsheets/test.jpg')
                @images = {
                    "standart"
                }
                @height = @image.height
                @width = @image.width
                super(x,y,z)
                load_animation([
                    {t: 0, x: 32*2,  y: 32*2},
                    {t: 30*1, x: 32*8,  y: 32*2},
                    {t: 30*2, x: 32*8,  y: 32*8},
                    {t: 30*3, x: 32*2,  y: 32*8},
                    {t: 30*4, x: 32*2,  y: 32*2},
                    {t: 30*5, x: 32*2,  y: 32*2},
                    {t: 30*6, x: 32*2,  y: 32*8},
                    {t: 30*7, x: 32*8,  y: 32*8},
                    {t: 30*8, x: 32*8,  y: 32*2},
                    {t: 30*9, x: 32*2,  y: 32*2},
                ])
            end

            def pre
                puts "I am #{@name}!"
            end

            def button_down(id)
                case id
                    when Gosu::KbLeft
                        if place_free(@x - 32, @y)
                            if @x > 0
                                @x -= 32
                            # else
                            #     puts "there is wall"
                            end
                        # else
                        #     puts "place no free"
                        end
                    when Gosu::KbRight
                        if  place_free(@x + 32, @y)
                            if @x < @parent.width - @width
                                @x += 32
                            else
                                puts "level 2. You can't step outside of the world."
                            end
                        else
                            puts "level 1. it's the collisions fault"
                        end
                    when Gosu::KbUp
                        if place_free(@x, @y - 32) && @y > 0
                            @y -= 32 # if y > step_size - change this
                        end
                    when Gosu::KbDown
                        if place_free(@x, @y + 32) && @y < @parent.height - @height
                            @y += 32
                        end
                    when Gosu::KbC
                        # @anim_index = 0 # rewind the animation with this
                    when Gosu::KbX
                        puts "#{@name} ->  x: #{@x} | y: #{@y}"
                    when Gosu::KbReturn
                        if rand(100) > 50
                            $window.state.cam.focus = self
                        end
                end
            end

            def button_up(id)
                case id
                    when false
                end
            end

            def update
                if @animatable
                    animate
                end
            end

            def draw
                @image.draw(
                    @x - $window.state.cam.x + $window.state.cam.offset_x,
                    @y - $window.state.cam.y + $window.state.cam.offset_y,
                    @z#, scale_x, scale_y
                )
            end


            # Collision Functions

            # # idk why, but this one is bugged atm
            # Determines if there is a solid object at this point
            def place_free(x, y)
                if @parent.entities.count < 2
                    return true # If there is no other object, what could you collide against?
                else
                    @parent.entities.each do |e|
                        unless e === self
                            if MathG::check_collision(e.x,e.y,e.width,e.height,  x, y, x + @width,y + @height)
                                return false # unless collision, place is free!
                            end
                        end
                    end
                end
            end

        end
    end
end