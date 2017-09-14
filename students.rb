students = []
eye_colors = []
ages = []
driving_age = []
green_eyed = []
most_vowels = []
File.open("student_data.csv").each do |line|
    info = line.split(",")
    students.push(info[0].strip)
    eye_colors.push(info[1].strip)
    ages.push(info[2].strip.to_i)
end

# print students, "\n"
# print eye_colors, "\n"
# print ages, "\n"

def eye_color(eye_colors)
    sum = 0
    eye_colors.each do |color|
        if color == "Brown"
            sum += 1
        end
    end
    puts sum
end
def driving_maturity(ages)
    ages.each_with_index do |age, i|
        if age >= 17
            driving_age.push(students[i])
        end
    end
end

def green_eyed_girl(eye_colors)
    eye_colors.each_with_index do |color, i|
        if color == "Green" && (i % 2 == 0)
            green_eyed.push(students[i])
        end
    end
    
end


def person_with_most_vowels(ages, students)
    max_vowel = 0
    max_name = "Alice"
    ages.each_with_index do |age, i|
        if age == 15
            total_vowel = 0
            students[i].chars.each do |vowel|
                if vowel == "a" || vowel == "e" || vowel == "i" || vowel =="o" || vowel =="u"
                    total_vowel += 1
                
                end
            end
            if total_vowel >= max_vowel
                max_vowel = total_vowel
                max_name = students[i]
            end


        end
        
    end
    return max_name
end

puts person_with_most_vowels(ages, students)

def avg_green_eyed(eye_colors, ages)
    age_sum = 0
    number_of = 0
    eye_colors.each_with_index do |color, i|
        if color == "Green"
            age_sum += ages[i]
            number_of += 1
        end
    end
    green_age_sum = age_sum / number_of
    return green_age_sum
end

puts avg_green_eyed(eye_colors, ages)


