var englishText = "this is a secret message"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

// Add your code below 🤫
var letterToMorse = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  "!": "-.-.--",
  ".": ".-.-.-",
  "?": "..--..",
  ",": "--..--"
]

var morseText: String = ""

englishText = englishText.lowercased()

for element in englishText {
  if let morseChar = letterToMorse["\(element)"] {
    morseText += (morseChar + " ") 
  } else {
    morseText += "   "
  }
}

print(morseText)

var decodedMessage: String = ""

var morseCodeArray = [String]()

var currMorse: String = ""

for char in secretMessage {
  if char != " " {
    currMorse += String(char)
  } else {

    switch currMorse {
      case "": 
        currMorse += " "
      case " ":
        morseCodeArray.append(" ")
        currMorse = ""
      default:
        morseCodeArray.append(currMorse)
        currMorse = ""
    }

  }
}

morseCodeArray.append(currMorse)

print(morseCodeArray)

//2ND PART OF PROJECT

var morseToLetter = [String: String]()

for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}

print(morseToLetter)

var begSentence = true

for morseValue in morseCodeArray {
  if let letterChar = morseToLetter[morseValue] {
    if begSentence == true {
        decodedMessage += letterChar.uppercased()
    } else {
        decodedMessage += letterChar
    }
  } else {
    decodedMessage += " "
  }
  begSentence = false
}

print(decodedMessage)

