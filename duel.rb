def Battle(condition = 'first')
  if condition == 'first'
    firstCall = 'じゃんけん…'
    call = 'ポイ！'
  elsif condition == 'draw'
    firstCall = 'あいこで…'
    call = 'しょ！'
  end

  puts firstCall
  puts '0(グー)1(チョキ)2(パー)3(戦わない)'

  my_hand = gets.to_i
  enemy_hand = rand(0..2)

  hands = %W[\u30B0\u30FC \u30C1\u30E7\u30AD \u30D1\u30FC \u6226\u308F\u306A\u3044]

  puts call
  puts '==================='
  p 'あなた:' + hands[my_hand]
  p '相手:' + hands[enemy_hand]
  puts '==================='

  if my_hand == 3
    puts 'ゲームを終了します'
  else
    judge(enemy_hand, my_hand)
  end
end

def judge(enemy_hand, my_hand)
  case enemy_hand
  when 0 # 0(グー)
    if my_hand == 0 # 0(グー)
      Battle('draw')
    elsif my_hand == 1 # 1(チョキ)
      fingerPointingGame('enemy_turn')
    elsif my_hand == 2 # 2(パー)
      fingerPointingGame('my_turn')
    end
  when 1 # 1(チョキ)
    if my_hand == 0 # 0(グー)
      fingerPointingGame('my_turn')
    elsif my_hand == 1 # 1(チョキ)
      Battle('draw')
    elsif my_hand == 2 # 2(パー)
      fingerPointingGame('enemy_turn')
    end
  when 2 # 2(パー)
    if my_hand == 0 # 0(グー)
      fingerPointingGame('enemy_turn')
    elsif my_hand == 1 # 1(チョキ)
      fingerPointingGame('my_turn')
    elsif my_hand == 2 # 2(パー)
      Battle('draw')
    end
  end
end

def fingerPointingGame(turn)
  if turn == 'my_turn'
    turnMsg = '指す方向:'
    result = 'あなたの勝ちです！'
  elsif turn == 'enemy_turn'
    turnMsg = '向く方向:'
    result = 'あなたの負けです…'
  end

  puts 'あっち向いて…'

  directions = %W[\u4E0A \u53F3 \u4E0B \u5DE6]
  puts turnMsg + '0(上)1(右)2(下)3(左)'

  my_direct = gets.to_i
  enemy_direct = rand(0..3)

  puts 'ホイ！'
  puts '==================='
  p '相手:' + directions[enemy_direct]
  p 'あなた:' + directions[my_direct]
  puts '==================='

  if my_direct == enemy_direct
    puts result
  else
    Battle()
  end
end

Battle()
