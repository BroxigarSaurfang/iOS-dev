let str = "The Curious Case of Benjamin Button"

var appendStr = ""
var resultStr = Array<String>()

for i  in str {
    if i != " " {
        appendStr += i
    } else {
        resultStr.append(appendStr)
        appendStr = ""
    }
}

print(resultStr.count)