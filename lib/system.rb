module Editor
    # This class controls Low-Level Actions for the Game Engine.
    class System
        
        def self.state_update(state)
            $window.state_update(next_state: state)
        end

        def self.puts_window
            puts $window.caption
        end
        
        # Exit the game.
        def self.exit_game
            exit(0)
        end
    end
end