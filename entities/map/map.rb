module RRPG
        
    module Entity
        class Map
            include EntityBase
            attr_reader :width, :height
            attr_accessor :x, :y, :entities
            def initialize(tileset, tiles, entities: [], actors: [])
                @size = $tile_size
                @width = tiles.first.length * @size
                @height = tiles.length * @size
                @tileset = Gosu::Image.load_tiles(tileset, $tile_size, $tile_size)
                @tiles = tiles
                @entities = entities # A map can have it's own entities. e.g. players, monsters, layer objects
                actors.each { |a| create_actor(a[:name],a[:x],a[:y],60,self) }
            end

            def button_up(id)
                if @entities.any?
                    @entities.each do |e|
                        e.button_up(id)
                    end
                end
            end

            def button_down(id)
                if @entities.any?
                    @entities.each do |e|
                        e.button_down(id)
                    end
                end
            end

            def update
                if @entities.any?
                    @entities.each do |e|
                        e.update
                    end
                end
            end

            def draw
                @tiles.each_with_index do |row, i_y|
                    row.each_with_index do |tile, i_x|
                        @tileset[tile].draw(
                            (i_x * @size) - $window.state.cam.x + $window.state.cam.offset_x,
                            (i_y * @size) - $window.state.cam.y + $window.state.cam.offset_y,
                            20
                        )
                    end
                end

                if @entities.any?
                    @entities.each do |e|
                        e.draw
                    end
                end
            end


            # Other Functions

            def create_actor(name,x,y,z,parent)
                @entities << Entity::Actor.new(name,x,y,z,parent: self)
            end

            # Fetching Functions

            def get_actors
                actors = []
                for entity in @entities
                    actors << entity if entity.class == Actor
                end

                return actors
            end


        end
    end
end