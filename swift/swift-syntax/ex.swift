let helloWorld = "Hellouu World"
let idx2 = helloWorld.index(helloWorld.startIndex, offsetBy: 1)
let idx1 = helloWorld.index(helloWorld.startIndex, offsetBy: 5)
print(helloWorld[idx2..<idx1])