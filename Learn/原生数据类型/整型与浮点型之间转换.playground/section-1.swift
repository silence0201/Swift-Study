

let historyScore: Float = 90.6

let englishScore: UInt16 = 130

//let totalScore = historyScore + englishScore  //错误

//let totalScore = historyScore + Float(englishScore)  //正确，安全

let totalScore = UInt16(historyScore) + englishScore  //正确，小数被截掉
