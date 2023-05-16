def triad(root)
  third = root + 4
  fifth = root + 7
  notes = [root, third, fifth]
  notes = notes.map do |x|
    x >= 12 ? x - 12 : x
  end
  return notes
end



scale = ["C", "C#(D♭)" , "D", "D#(E♭)", "E", "F", "F#(G♭)", "G", "G#(A♭)", "A", "A#(B♭)", "B"]
puts "構成音を知りたいコードを入力してください"
chord = gets.chomp
root = scale.index(chord) #root音を数字に変える

notes = triad(root)
notes = notes.map{|x| scale[x]}

#文字に戻す
puts "#{chord}の構成音は[#{notes.join(",")}]です" 