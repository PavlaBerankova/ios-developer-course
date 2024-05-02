// Struct and Classes

import UIKit

struct Person {
    let firstName: String
    let lastName: String
}

struct Human {
    var firstName: String
    let lastName: String

    mutating func changeName(newName: String) {
        firstName = newName
    }
}

let person = Person(firstName: "CJ", lastName: "Parker")



class Lesson: Equatable {
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        lhs.name == rhs.name
    }
    
    var name: String = ""

    init(name: String) {
        self.name = name
    }
}

let classOne = Lesson(name: "Second")
let classTwo = Lesson(name: "Second")
print(classOne == classTwo)
print(classOne === classTwo)
