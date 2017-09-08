students = []
eye_color = []
ages = []

File.open("student_data.csv").each do |line|
    info = line.split(",")
    students.push(info[0].strip)
    eye_color.push(info[1].strip)
    ages.push(info[2].strip.to_i)
end

print students, "\n"
print eye_color, "\n"
print ages, "\n"