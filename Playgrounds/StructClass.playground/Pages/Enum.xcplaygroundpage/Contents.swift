//: [Previous](@previous)

import Foundation

enum Language: String, Error {
    case objC
    case Swift = "swift"
}

let language = Language.Swift
print(language)
print(language.rawValue)


enum Country: Equatable {
    case czech(currency: String)
    case slovak(curr: String)

//    static func == (lhs: Country, rhs: Country) -> Bool {
//        switch (lhs, rhs) {
//        case let (.czech(currencylhs), .czech(currencyrhs))
//        }
//    }
}

let czech = Country.czech(currency: "Kč")
let newCzech = Country.czech(currency: "EUR")

print(newCzech == czech)

if case let .czech(currency) = czech {
    print(currency)
}

//switch czech {
//case let .czech(currencyO, currencySecond):
//    print(currencySecond)
//default:
//    print("nothing here")
//}

enum AuthPersmission {
    case notDetermined
    case authorized
    case denied
}

let auth = AuthPersmission.denied

switch auth {
case .authorized:
    print("authorized")
@unknown default:
    print("You don't know yet")
}

//: [Next](@next)
