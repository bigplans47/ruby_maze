class Maze

  attr_reader(:win_page)
  def initialize()
    @user_path = []
    @user_items = []
    @win_page = false
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
    if @user_path == []
      "You see a plaque. It reads...Two paths lie ahead of you, pick (Right or Left) now to start  your journey."
    elsif @user_path == ["L","R","R"] or @user_path == ["R","L","L"]
      @win_page = true
      "You see a light up ahead...You made it to the city of Atlantis"
    elsif @user_path == ["L"]
      @user_items.push("key")
      "You have found a mysterious key with your name written on it. You figure since it has your name on it, it is your destiny to take it. You store it in your pocket. Pick your next path."
    elsif @user_path == ["R","R"]
      @user_path.pop
      @user_items.push("protection-amulet")
      "You have walked up to the edge of an underground waterfall. You are forced to turn back but find an amulet to protect you. Pick a different path..."
    elsif @user_path == ["R","L","R"]
      if @user_items.include?("protection-amulet")
        @win_page = true
        "You have reached a cavern filles with a glistening underground lake. But! Then the water begins to rise and form a figure. It's Posiedon!! He demands you leave his presence at once or face eternal water baording. You refuse and drink with him. Posiedon is impressed with you and takes you to Atlantis, you win"
      else
      @user_path = []
      # @user_items.push("forgetfulness-juice")
      "You have reached a cavern filles with a glistening underground lake. But! Then the water begins to rise and form a figure. It's Posiedon!! He demands you leave his presence at once or face eternal water baording. You refuse and drink with him and pass out..."
      end
    elsif @user_path == ["L","L"] or @user_path == ["L","R","L"]
      if @user_items.include?("key")
        @win_page = true
        "You see a door with a key hole. Pulling the key from your pocket, you insert it in the door. The door creaks open. Welcome to Atlantis."
      # this code is unused bc you always have the key
      else
        "There's a door at the end of the room, but you have no way to open it. Maybe you should've grabbed the key...You have to turn back"
      end
    else
      "Welcome to the next room. You have the same choice."
    end
  end
end
