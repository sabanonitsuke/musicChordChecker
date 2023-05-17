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

#メジャー・マイナー判別
if chord.include?("m")
  notes = minor_triad(root)
  #短調基準のコード判別
  notes[2] -= 1 if chord.include?("dim")
else
  notes = major_triad(root)
  #長調基準のコードの判別
  if chord.include?("sus4")
    notes[1] += 1
  elsif chord.include?("aug")
    notes[2] += 1
  elsif chord.include?("6")
    notes[2] += 2
  end
end

#長調・短調どちらもあり得るコードの判別
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