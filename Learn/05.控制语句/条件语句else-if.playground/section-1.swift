

let testscore = 76

var grade: Character

if testscore >= 90 {
    grade = "A"
} else if testscore >= 80 {
    grade = "B"
} else if testscore >= 70 {
    grade = "C"
} else if testscore >= 60 {
    grade = "D"
} else {
    grade = "F"
}

print("Grade = \(grade)")

