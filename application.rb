def triad(root)
  third = root + 4
  fifth = root + 7
  notes = [root, third, fifth]
  return notes
end



scale = ["C", "C# or D♭" , "D", "D# or E♭", "E", "F", "F# or G♭", "G", "G# or A♭", "A", "A# or B♭", "B"]
puts "構成音を知りたいコードを入力してください"
chord = gets.chomp
root = scale.index(chord) #root音を数字に変える


notes = triad(root)
print notes.map{|x| scale[x]}