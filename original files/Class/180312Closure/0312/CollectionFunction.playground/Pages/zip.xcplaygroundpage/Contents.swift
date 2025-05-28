//: [Previous](@previous)
//: # zip
/***************************************************
 func zip<Sequence1, Sequence2>(
   _ sequence1: Sequence1,
   _ sequence2: Sequence2
 ) -> Zip2Sequence<Sequence1, Sequence2> where Sequence1 : Sequence, Sequence2 : Sequence
 
 - 두 개의 시퀀스를 통해 새로운 한 쌍의 시퀀스를 생성
 ***************************************************/

print("- example1 -")
let words = ["일", "이", "삼", "사"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
  print("\(word): \(number)")
}

print("\n- example2 -")
let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))
print(zipped)


print("\n- example3 -")
let names = ["James", "Edward", "John", "Jessie", "Julia"]
let scores = [100, nil, 90, nil, 70, nil]
zip(names, scores).forEach { print($0, $1) }
print()
zip(names, scores.flatMap { $0 }).forEach { print($0, $1) }

print("\n- example4 -")
let filenames = ["image", "text", "video"]
let extensions = ["png", "txt", "mpeg", "pdf", "jpeg", "html"]
zip(filenames, extensions).forEach { print($0 + "." + $1) }

//: [Next](@next)
