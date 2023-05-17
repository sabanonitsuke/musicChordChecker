def get_root(chord, scale)
  code = chord.match(/[A-G]/).to_s
  root = scale.index(code)
  root += 1 if chord.include?("#")
  root -= 1 if chord.include?("♭")
  return root
end

def major(root)
  third = root + 4
  fifth = root + 7
  return [root, third, fifth]
end

def minor(root)
  third = root + 3
  fifth = root + 7
  return [root, third, fifth]
end

scale = ["C", "C#(D♭)" , "D", "D#(E♭)", "E", "F", "F#(G♭)", "G", "G#(A♭)", "A", "A#(B♭)", "B"]
chord = gets.chomp
root = get_root(chord, scale)

#メジャー・マイナー判別
if chord.include?("m")
  notes = minor(root)
  #短調基準のコード判別
  notes[2] -= 1 if chord.include?("dim")
else
  notes = major(root)
  #長調基準のコードの判別
  notes[1] += 1 if chord.include?("sus4")
  notes[2] += 1 if chord.include?("aug")
  notes[2] += 2 if chord.include?("6")
end

#長調・短調どちらもあり得るコードの判別
if chord.include?("M7")
  notes << root + 11
elsif chord.include?("7")
  notes << root + 10
  #m7-5コード判別
  notes[2] -= 1 if chord.include?("m7-5")
elsif chord.include?("add9")
  notes.insert(1, root + 2)
end

notes = notes.map do |x|
  x >= 12 ? x - 12 : x
end

notes = notes.map{|x| scale[x]}
puts "#{chord}の構成音は[#{notes.join(", ")}]" 