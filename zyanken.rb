def janken
end

loop do
  puts "じゃんけん・・・"
  puts "0:グー 1:チョキ 2:パー 3:終了する"

  input = gets.chomp
  case input
  when "0", "1", "2"
    janken
  when "3"
    puts "ゲームを終了します。"
    break
  else
    puts "不正な値です。"
  end
end