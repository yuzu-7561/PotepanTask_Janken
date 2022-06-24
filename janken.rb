
class Game
  
  @hands = ["グー", "チョキ","パー"]
  @direction = ["上", "下", "左", "右"]
  @my_win = 0
  @enemy_win = 0
  @game_result = ""
  @aiko_flg = false
  @game_flg = true
  
  def self.aiko
    puts "あいこで..."
    @aiko_flg = true
  end
  
  def self.hoi
    
    flg = true
    
    while flg == true do
    puts "0(上) 1(下) 2(左) 3(右)"
      direction_number = gets.to_i
      if direction_number == 0 || direction_number == 1 || direction_number == 2 || direction_number == 3 
        flg = false
      else
        puts "※0~3を入力してください※"
      end
    end
    my_direction = @direction[direction_number]
    enemy_direction = @direction.sample
    puts "ほい！"
    puts "------------------------"
    puts "あなた：#{my_direction}"
    puts "相手　：#{enemy_direction}"
    puts "------------------------"
    if my_direction == enemy_direction
      return true
    else
      return false
    end
  end
  
  def self.my_hoi
    puts "自分：あっち向いて〜"
    @game_result = hoi
    @aiko_flg = false
    if @game_result == true
      puts "あなたに１点プラスです"
      @my_win += 1
    end
  end
  
  def self.enemy_hoi
    puts "相手：あっち向いて〜"
    @game_result = hoi
    @aiko_flg = false
    if @game_result == true
      puts "相手に１点プラスです"
      @enemy_win += 1
    end
  end
  
  def self.janken(my, enemy)
    if my == 0
      aiko if enemy == 0
      my_hoi if enemy == 1
      enemy_hoi if enemy == 2
    elsif my == 1
      enemy_hoi if enemy == 0
      aiko if enemy == 1
      my_hoi if enemy == 2
    elsif my == 2
      my_hoi if enemy == 0
      enemy_hoi if enemy == 1
      aiko if enemy == 2
    end
  end

  loop {
    if @aiko_flg == false
      puts "じゃんけん..."
    end
    puts "0(グー) 1(チョキ) 2(パー) 3(じゃんけんを終了)"
    number = gets.to_i
    if number == 0 || number == 1 || number == 2 || number == 3 
      if number == 3
        if @my_win > @enemy_win
          puts "めでとうございます！#{@my_win}対#{@enemy_win}であなたの勝ちです！"
        elsif @my_win < @enemy_win
          puts "残念！#{@my_win}対#{@enemy_win}で相手の勝ちです！"
        else
          puts "#{@my_win}対#{@enemy_win}で結果は引き分けです！"
        end
        puts "ゲームを終了します"
        break
      end
      my_hand = @hands[number]
      enemy_hand = @hands.sample
      if @aiko_flg == false
        puts "ポン！"
      else  
        puts "ショ！"
      end
      puts "------------------------"
      puts "あなた：#{my_hand}"
      puts "相手　：#{enemy_hand}"
      puts "------------------------"
      my_hand_idx = number
      enemy_hand_idx = @hands.index(enemy_hand)
      janken(my_hand_idx, enemy_hand_idx)
    else
      puts "※0~3を入力してください※"
    end
  }
end

Game.new