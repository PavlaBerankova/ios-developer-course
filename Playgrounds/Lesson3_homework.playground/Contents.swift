import Foundation

// EventType protocol
// Define an EventType protocol which allows you to read the name of EventType.
protocol EventType {
    var name: String { get }
}


// AnalyticEvent Protocol
// Define a protocol named AnalyticEvent that has a variable type which is of associated type constrained to EventType.  Another variable defined by protocol is named parameters of type [String: Any]. Create an extension of AnalyticEvent  with a computed variable name which is taken from type.

protocol AnalyticEvent {
    associatedtype ItemType: EventType
    var type: ItemType { get }
    var parameters: [String: Any] { get }
}

extension AnalyticEvent {
    var name: String {
          return type.name
      }
}


// Event Implementations:
// Implement at least two different structs that conform to AnalyticEvent, representing different types of events (e.g., ScreenViewEvent and UserActionEvent). Each should carry relevant data as parameters but having different types.

struct UserActionEvent: AnalyticEvent {
  typealias ItemType = UserActionEventType
    var userName: String
    var type: ItemType
    var parameters: [String : Any]
}

struct ScreenViewEvent: AnalyticEvent {
    typealias ItemType = ScreenEventType
    var type: ItemType
    var parameters: [String : Any]
}

struct UserActionEventType: EventType {
    var name: String
}

struct ScreenEventType: EventType {
    var name: String
}


// AnalyticsService Protocol:
// Create a protocol named AnalyticsService with a single generic method logEvent(_: ). This method should accept any type conforming to AnalyticEvent.

protocol AnalyticsService {
   mutating func logEvent<T: AnalyticEvent>(_ event: T)
}


// Analytics Service Implementations:
// Implement at least one concrete analytics service that conforms to AnalyticsService. For simplicity, this service can log events to the console with print. The service should also store all called logs into the array.

struct LogEventsService: AnalyticsService {
    var calledLogs: [String] = []

    mutating func logEvent<T>(_ event: T) where T : AnalyticEvent {
        print(event.name)
        print(event.parameters)
      calledLogs.append("Event name: \(event.name), parameters: \(event.parameters)")
    }
}


// Usage example:
// Write a sample code using the designed API.

struct User {
    var name: String
    var actionType: UserActionEventType
    var parameters: [String: Any]

    func printAll() {
        print("User \(name) has taken an action: \(actionType.name), with these parameters: \(parameters)")
    }
}

var eventLogger = LogEventsService()

let userOne = User(name: "Pavla", actionType: UserActionEventType(name: "Tap on Button"), parameters: ["buttonName": "Buy Now", "isTapped": true])
let userTwo = User(name: "Tereza", actionType: UserActionEventType(name: "Fill survey"), parameters: ["surveyTitle": "Satisfaction Survey", "allFilledIn": false])

let buttonPressEvent = UserActionEvent(
    userName: userOne.name,
    type: userOne.actionType,
    parameters: userOne.parameters
)

eventLogger.logEvent(buttonPressEvent)
print(buttonPressEvent)
print(eventLogger.calledLogs)
userOne.printAll()

let fillSurveyEvent = UserActionEvent(
    userName: userTwo.name,
    type: userTwo.actionType,
    parameters: userTwo.parameters)

eventLogger.logEvent(fillSurveyEvent)
userTwo.printAll()
eventLogger.calledLogs



var userViewScreen = ScreenViewEvent(type: ScreenEventType(name: "View on Screen"), parameters: ["screenTitle": "Main Screen", "pageNumber": 3])
// let userTwo = User(name: "Tereza", actionType: "View on Screen")
//var userViewOnScreen = ScreenEventType(name: userTwo.actionType)


