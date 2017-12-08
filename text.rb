Dir.chdir("text")
i = 0
20.times do 
    i+=1
    File.open("newfile#{i}.txt", "w+") do |file|
        file.write("hello world!")
    end
end

