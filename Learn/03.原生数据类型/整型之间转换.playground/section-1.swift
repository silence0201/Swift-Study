

let historyScore: UInt8 = 90

let englishScore: UInt16 = 130

//let totalScore = historyScore + englishScore  //错误

//let totalScore = UInt16(historyScore) + englishScore   //正确，安全

let totalScore = historyScore + UInt8(englishScore)  //正确，不安全
