module Editor
    module Entity
        class Input < Editor::Entity::Base
            def initialize(window, x, y, z)
                super(window,x,y,z)
                @active = false
                @cursor = 0
            end

        end
    end
end