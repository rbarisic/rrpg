module RRPG
    # Math for Games        
    module MathG

        def self.check_collision(x1, y1, w1, h1, x2, y2, w2, h2)
            if( (x1      < x2 + w2 )  &&
                (x1 + w1 > x2      )  &&
                (y1      < y2 + h2 )  &&
                (y1 + h1 > y2      )   )
                return true
            else
                return false
            end
        end

        def self.distance(a: 0, b: 0, speed: 0)
            return Math.sqrt( (a - b) * ( a - b) ) / speed # change this later
        end

        def self.distanceF(a: 0, b: 0, step: 0, max: 0)
            return Math.sqrt( (a - b) * ( a - b) ) # change this later
        end

        def self.interpolate(x1: 0, x2: 0, t1: 0, t2: 0, steps: 0)
            return x1 + ( ( (x2 - x1) / (t2 - t1) ) * steps )
        end

        def self.interpolateF(x1: 0, x2: 0, time_total: 0, steps: 0)
            return x1 + ( ( (x2 - x1) / time_total) * steps )
        end
    end
end