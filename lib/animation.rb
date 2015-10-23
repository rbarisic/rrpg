module RRPG
    module Animatable
        def animation=(anim)
            @animation = anim
        end

        def animation
            @animation || nil
        end

        def load_animation(keyframes)
            @keyframes = keyframes
            @animatable = true
            # @keyframe_one = { x: 0, y: 0 }
            # @keyframe_two = { x: 240, y: 320 } # this has been implemented in the keyframes array         
            @anim_length = @keyframes.last[:t]
            @anim_active = true
            @anim_start = 0
            @anim_end = @anim_length
            @anim_index = 0

            @anim_frames = []

            create_frames
            puts "Animation added to #{self}"
        end


        # @keyframes[i][:t] defines the frame offset for the current keyframe.
        def create_frames
            (@keyframes.count - 1).times do |i|
                raise('Cannot assign the same time(t) to multiple keyframes!') if ( @keyframes[i][:t] == @keyframes[i+1][:t] )

                time_diff = @keyframes[i+1][:t] - @keyframes[i][:t]

                time_diff.times do |j|
                    current_frame = @anim_frames[@keyframes[i][:t] + j]

                    current_frame = {
                        x: MathG.interpolateF(x1: @keyframes[i][:x].to_f, x2: @keyframes[i+1][:x].to_f, time_total: time_diff.to_f, steps: j.to_f),
                        y: MathG.interpolateF(x1: @keyframes[i][:y].to_f, x2: @keyframes[i+1][:y].to_f, time_total: time_diff.to_f, steps: j.to_f),
                    }

                    # finally, assign the frame to the frame-array
                    @anim_frames[@keyframes[i][:t] + j] = current_frame
                    puts "FRAME: #{@keyframes[i][:t] + j} | x: #{current_frame[:x]} | y: #{current_frame[:y]} | i: #{i} | j: #{j}"
                end
            end
            # After iterating over all except the last frame,
            # just assign the last frame's values to it, no need to do calculations here.
            @anim_frames[@keyframes.last[:t]] = @keyframes.last
        end

        def animate
            if (@anim_index < @anim_end)
                @anim_index += 1

                @x = @anim_frames[@anim_index][:x]
                @y = @anim_frames[@anim_index][:y]
            end
        end
    end
end