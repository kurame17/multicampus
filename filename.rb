Dir.chdir("text")

text = Dir.entries(Dir.pwd).reject{|i|
    i[0] == "."
}

text.each do |t|
    File.rename(t, t.gsub("new", "new_"))
end