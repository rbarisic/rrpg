# This is an ordinary list menu
module Editor
    module Entity
        module UI
            class Menu < Editor::Entity::Base
                def initialize(x, y, z, menu_entries: [])
                    super(x,y,z)
                    @menu_entries = menu_entries # menu_entries
                    @cursor = 0 # The cursor is a pointer for the menu
                    @active = true
                    puts "A menu has been created. #{self}"
                end

                def button_down(id)
                    case(id)
                        when Gosu::KbUp
                            if @active == true
                                if @cursor <= 0
                                    @cursor = @menu_entries.count - 1
                                else
                                    @cursor -= 1
                                end
                            end
                        when Gosu::KbDown
                            if @active == true
                                if @cursor >= @menu_entries.count - 1
                                    @cursor = 0
                                else
                                    @cursor += 1
                                end
                            end
                        when Gosu::KbLeft

                        when Gosu::KbRight

                        when Gosu::KbReturn
                            puts @menu_entries[@cursor].text + "   | #{@cursor}"
                            @menu_entries[@cursor].click
                    end
                end

                def draw
                    @menu_entries.each_with_index do |item, index|
                        $window.font[:md].draw(item.text.to_s, @x + 32 + 8, @y + ($window.font[:md].height + 8) * index + 32, @z)
                    end

                    $window.images[:cursor].draw(@x + 4,@y + 16 + 8 + (@cursor * ($font_height + 8)), 10)

                    $window.font[:lg].draw("Ruby RPG - Editor", 32, 32, 32) if true
                end
            end

            class MenuEntry
                attr_accessor :text, :function
                def initialize(text, function = function)
                    @text = text
                    @function = function
                end

                def click
                    @function.call
                end
            end
        end
    end
end