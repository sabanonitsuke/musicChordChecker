def triad(root)
  third = root + 4
  fifth = root + 7
  return [root, third, fifth]
end



scale = ["C", "C#(D♭)" , "D", "D#(E♭)", "E", "F", "F#(G♭)", "G", "G#(A♭)", "A", "A#(B♭)", "B"]
puts "構成音を知りたいコードを入力してください"
chord = gets.chomp
root = scale.index(chord) #root音を数字に変える

#関数を呼び出す
notes = triad(root)

#はみ出した音を調整
notes = notes.map do |x|
  x >= 12 ? x - 12 : x
end

#音階を文字に変換
notes = notes.map{|x| scale[x]}

#文字に戻す
puts "#{chord}の構成音は[#{notes.join(",")}]です" 