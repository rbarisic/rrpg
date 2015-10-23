module RRPG
        
    
    # This is the main Window class where all the magic happens
    class Window < Gosu::Window
        attr_accessor :states, :entities, :texts, :font, :images, :state, :previous_state
        include Observable

        def initialize(width, height, fullscreen = false)
            super(width, height, fullscreen)
            $system = System.new
            self.caption = "RRPG - Editor"
            @entities = []
            @images = { }
            @images[:cursor] = Gosu::Image.new('editor/cursor.png')
            @font = {} # this is necessary
            # @font[:sm] = Gosu::Font.new(($font_height * 0.8).to_i, name: "Noteworthy")
            # @font[:md] = Gosu::Font.new($font_height, name: "Noteworthy")
            @font[:sm] = Gosu::Font.new(($font_height * 0.8).to_i)
            @font[:md] = Gosu::Font.new($font_height)
            @font[:lg] = Gosu::Font.new(($font_height * 1.5).to_i)
            # @states = {}
            # @states = create_states('./states/editor.yml')
            @states = {}
            @state
            @previous_state
        end

        def show
            @state = @states[:start_menu]
            @previous_state = @state
            super
        end

        def create_state(state)
            @states[state] = state
        end

        def create_states(script)
            require("./data/apps/#{script}")
        end

        # def create_states(file)
        #     states_yaml = YAML.load_file(file)
        #     states_yaml.each do |state, entities|

        #         self.states[state] = State.new(self, state, entities['entities'])

        #     end
        # end

        def button_up(id)
            @state.button_up(id)
        end

        def button_down(id)
            case id
                when Gosu::KbQ
                    exit(0)
            end 
            @state.button_down(id)

            # case id
            #     when Gosu::KbQ
            #         p "closing editor"
            #         exit(0)
            # end
        end

        def state_update(args)
            if args.include? :next_state
                puts "Load State"
                @previous_state = @state
                @state = @states[args[:next_state]]
            elsif args.include? :go_back
                @state = @previous_state
            else
                abort "Couldn't change the State. Aborting.".colorize(:red)
            end
        end

        def update
            @state.update
        end

        def draw
            self.draw_quad(
                #1
                0,0,Gosu::Color.argb(0x333333ff),
                #2
                self.width,0,Gosu::Color.argb(0x333333ff),
                #3
                0,self.height,Gosu::Color.argb(0xff00ffff),
                #4
                self.width,self.height,Gosu::Color.argb(0xff00ffff),

                z = 0,
                mode = :default
            )
            @font[:md].draw("#{@state.to_s}",16,16,2000)
            @font[:md].draw("Entities: #{@state.entities.to_s}",16,32,2000)
            @state.draw
        end
    end
end