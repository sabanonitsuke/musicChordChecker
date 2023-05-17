def major_triad(root)
  third = root + 4
  fifth = root + 7
  return [root, third, fifth]
end

def minor_triad(root)
  third = root + 3
  fifth = root + 7
  return [root, third, fifth]
end


scale = ["C", "C#(D♭)" , "D", "D#(E♭)", "E", "F", "F#(G♭)", "G", "G#(A♭)", "A", "A#(B♭)", "B"]
puts "コードを入力してください"
chord = gets.chomp

#rootを求める
code = chord.match(/[A-G]/).to_s
root = scale.index(code)
root += 1 if chord.include?("#")
root -= 1 if chord.include?("♭")

#メジャーとマイナーの判別
if chord.include?("m")
  notes = minor_triad(root)
else
  notes = major_triad(root)
end

#7thコードの判別
if chord.include?("M7")
  notes << root + 11
elsif chord.include?("7")
  notes << root + 10
elsif chord.include?("add9")
  notes.insert(1, root + 2)
end

#はみ出した音を調整
notes = notes.map do |x|
  x >= 12 ? x - 12 : x
end

#音階を文字に変換
notes = notes.map{|x| scale[x]}

#アウトプット
puts "#{chord}の構成音は[#{notes.join(", ")}]です" 