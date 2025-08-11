class ToyRobotSimulator
    DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]
    TABLE_SIZE = 5

    attr_reader :x, :y, :facing, :placed

    def initialize
        @placed = false
      end    

    def place(x, y, facing)
        return unless valid_position?(x, y) && DIRECTIONS.include?(facing)
        @x = x
        @y = y
        @facing = facing
        @placed = true
    end

    def left
        return unless placed
        @facing = case @facing
            when 'NORTH' then 'WEST'
            when 'WEST' then 'SOUTH'
            when 'SOUTH' then 'EAST'
            when 'EAST' then 'NORTH'
        end
    end

    def right
        return unless placed
        @facing = case @facing
            when 'NORTH' then 'EAST'
            when 'EAST' then 'SOUTH'
            when 'SOUTH' then 'WEST'
            when 'WEST' then 'NORTH'
        end  
    end

    def move
        return unless placed
        new_x, new_y = @x, @y
        case @facing
        when "NORTH" then new_y += 1
        when "SOUTH" then new_y -= 1
        when "EAST"  then new_x += 1
        when "WEST"  then new_x -= 1
        end
        place(new_x, new_y, @facing) if valid_position?(new_x, new_y)
    end

    def report
        return unless placed
        puts "#{@x},#{@y},#{@facing}"
    end

    private

    def valid_position?(x, y)
      x.between?(0, TABLE_SIZE - 1) && y.between?(0, TABLE_SIZE - 1)
    end
end

robot = ToyRobotSimulator.new
robot.place(0, 0, "NORTH")
robot.move
robot.report
robot.place(0, 0, "NORTH")
robot.left
robot.report
robot.place(1, 2, "EAST")
robot.move
robot.move
robot.left
robot.move
robot.report

