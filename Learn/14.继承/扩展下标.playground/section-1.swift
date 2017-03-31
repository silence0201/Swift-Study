
extension String {
    
    subscript(index: Int) -> String {
        
        if  index > self.characters.count {
            return ""
        }
        var c: String = ""
        var i = 0
        
        for character in self.characters {
            if (i == index) {
                c = String(character)
                break
            }
            i += 1
        }
        return c
    }
}

let s = "The quick brown fox jumps over the lazy dog"

print(s[0])
print("ABC"[2])
