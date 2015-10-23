# This is an ordinary list menu
module RRPG
        
    module Entity
        module UI
            class EditorTilePicker < RRPG::Entity::Widget
                def initialize(x, y, z, menu_entries: [])
                    super(x,y,z)
                    @cursor = 0 # The cursor is a pointer for the menu
                    @active = true
                    @bg_color = Gosu::Color.argb(0xcc000000)
                    @map = get_map
                end

                def get_map
                    $window.state.entities.each do |e|
                        if e.class == RRPG::Entity::Map
                            p "assigned #{e} as TilePickerWidget's Map."
                            return e 
                        end
                    end
                end

                def button_down(id)
                    case(id)
                        when Gosu::KbUp

                        when Gosu::KbDown

                        when Gosu::KbLeft

                        when Gosu::KbRight

                        when Gosu::KbReturn

                    end
                end

                def update
                end

                def draw
                    $window.draw_quad(
                        @x, @y, @bg_color,
                        @x + 32, @y, @bg_color,
                        @x, @y + 32, @bg_color,
                        @x + 32, @y + 32, @bg_color,
                        z = @z
                    )
                end

            end

        end
    end
end