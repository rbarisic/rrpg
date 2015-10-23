module RRPG
        
    module Entity
        class Input < Entity::Widget
            def initialize(window, x, y, z)
                super(window,x,y,z)
                @active = false
                @cursor = 0
            end

        end
    end
end