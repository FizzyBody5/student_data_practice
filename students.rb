students = []
eye_colors = []
ages = []
blood_type = []
driving_age = []
green_eyed_girls = []
most_vowels = []

File.open("student_data.csv").each do |line|
    info = line.split(",")
    students.push(info[0].strip)
    eye_colors.push(info[1].strip)
    ages.push(info[2].strip.to_i)
    blood_type.push(info[3].strip)
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
    return sum
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
            green_eyed_girls.push(students[i])
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

# puts person_with_most_vowels(ages, students)

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

# puts avg_green_eyed(eye_colors, ages)
def first_green_age(eye_colors, ages)
    eye_colors.each_with_index do |color, i|
        if color == "Green"
            return ages[i]
        end
    end
end

def closest_to_average_green_eyed(eye_colors, ages, students)
    average = avg_green_eyed(eye_colors, ages)
    closest_in_age = []
    closest = first_green_age(eye_colors, ages)
    eye_colors.each_with_index do |color, i|
        
        if color == "Green"
            if (average - ages[i]).abs < (closest).abs
                closest = (average - ages[i]).abs
                closest_in_age = [students[i]]
            elsif (average - ages[i]).abs == (average - closest).abs
                closest_in_age.push(students[i])
            end
        end
    end
    return closest_in_age
end

# puts closest_to_average_green_eyed(eye_colors, ages, students)

def find_student_blood_type(student_name, students, blood_type)
    student_blood_type = "A"
    students.each_with_index do |student, i|
        if student_name == student
            student_blood_type = blood_type[i]
        end
    end
    return student_blood_type
end
# puts find_student_blood_type("Lamar", students, blood_type)


def possible_blood_donors(student, students, blood_type)
    this_student_blood_type = find_student_blood_type(student, students, blood_type)
    possible_donor = []
    students.each do |a_student|
        student_blood=find_student_blood_type(a_student, students, blood_type)
        if this_student_blood_type == "O"
            if student_blood== "O" || student_blood == "A" || student_blood == "B" || student_blood == "AB"
                possible_donor.push(a_student)
            end
        end

        if this_student_blood_type == "A"
            if student_blood == "A" || student_blood == "AB"
                possible_donor.push(a_student)
            end
        end

        if this_student_blood_type == "B"
            if student_blood == "B" || student_blood == "AB"
                possible_donor.push(a_student)
            end
        end

        if this_student_blood_type == "AB"
            if student_blood == "AB"
                possible_donor.push(a_student)
            end
        end
    end
    return possible_donor
end

# puts possible_blood_donors("Alice", students, blood_type)


def most_blood_donors(students, blood_type)
    max_donor = 0
    num = []
    students.each do |student_name|
        
        if max_donor < possible_blood_donors(student_name, students, blood_type).length
            num = [student_name]
            max_donor = possible_blood_donors(student_name, students, blood_type).length
        elsif max_donor == possible_blood_donors(student_name, students, blood_type).length
            num.push(student_name)
        end
    end
    return max_donor
end

puts most_blood_donors(students, blood_type)
# puts possible_blood_donors("Alice", students, blood_type)
