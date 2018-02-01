var array: [String] = ["a","b","c","d","e"]

for ch in array
{
    print(ch)
    array.insert("g", at: 3)
}
