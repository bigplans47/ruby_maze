class Maze
  attr_accessor(:user_path)
  def initialize()
    @user_path = []

  end

  def navigate(user_input)
    if user_input.downcase == "left"
      @user_path.push("L")
    elsif user_input.downcase == "right"
      @user_path.push("R")
    else
      "wtf not an option right now. Pick \"right\" or \"left\""
    end
  end

  def path_checkr
    if @user_path == ["L","R","R"] or @user_path == ["R","L","L"]
      "You see a light up ahead...You made it to the city of Atlantis"
    elsif @user_path == ["R","R"] or @user_path == ["L","L"]
      @user_path.pop
      "You have walked up to the edge of an underground waterfall. You are forced to turn back. Pick a different path..."
    elsif @user_path == ["R","L","R"] or @user_path == ["L","R","L"]
      @user_path.pop
      "You have reached a cavern filles with a glistening underground lake. But! Then the water begins to rise and form a figure. It's Posiedon!! He demands you leave his presence at once or face eternal water baording. You bolt out of the cavern. Choose another path."
    else
      "Welcome to the next room. You have the same choice."
    end
  end
end
