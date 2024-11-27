def janken(my_hand, result)
  if result == :draw
    puts "しょ！"
  else
    puts "ぽん！"
  end

  hands = ["グー", "チョキ", "パー"]
  computer_hand = rand(0..2)

  puts "-------------------------------"
  puts "あなた: #{hands[my_hand]} vs #{hands[computer_hand]} :相手"
  puts "-------------------------------"

  if my_hand == computer_hand
    return :draw
  elsif my_hand == 0 && computer_hand == 1 || my_hand == 1 && computer_hand == 2 || my_hand == 2 && computer_hand == 0
    puts "勝った！相手を指先の方向に向かせよう！"
    return :win
  else
    puts "負けた！相手の方向を回避しよう！"
    return :lose
  end
end

def acchi_muite_hoi(result)
  puts "あっち向いて・・・"
  puts "0:上 1:右 2:下 3:左"

  directions = ["上", "右", "下", "左"]
  computer_direction = rand(0..3)
  my_direction = gets.chomp.to_i

  unless (0..3).include?(my_direction)
    puts "不正な値です。"
    return false
  end

  puts "-------------------------------"
  puts "あなた: #{directions[my_direction]} vs #{directions[computer_direction]} :相手"
  puts "-------------------------------"

  if my_direction == computer_direction
    if result == :win
      puts "おめでとう！あなたの勝ち！"
    elsif result == :lose
      puts "相手の勝ち！また挑戦してね！"
    end
    return true, :finish
  else
    if result == :win
      puts "残念！もう１度！"
    elsif result == :lose
      puts "セーフ！もう１度！"
    end
    return true, result
  end
end

result = ""
loop do
  if result == :draw
    puts "あいこで・・・"
  else
    puts "じゃんけん・・・"
  end
  puts "0:グー 1:チョキ 2:パー 3:終了する"

  my_hand = gets.chomp.to_i
  case my_hand
  when 0, 1, 2
    result = janken(my_hand, result)
    unless result == :draw
      loop do
        stop, result = acchi_muite_hoi(result)
        break if stop
      end
      break if result == :finish
    end
  when 3
    puts "ゲームを終了します。"
    break
  else
    puts "不正な値です。"
  end
end
