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
    var analyticEvent: any AnalyticEvent

    func printAll() {
      print("User \(name) has taken an action: \(analyticEvent.name), with these parameters: \(analyticEvent.parameters)")
    }
}

var eventLogger = LogEventsService()

let buttonPressEvent = UserActionEvent(
  type: UserActionEventType(
    name: "Tapped on Button"),
  parameters: ["buttonName": "Buy Now", "isTapped": true])

let fillSurveyEvent = UserActionEvent(
  type: UserActionEventType(
    name: "Filled Survey"),
  parameters: ["surveyTitle": "Satisfaction Survey", "allFilledIn": false])

let userOne = User(name: "Pavla", analyticEvent: buttonPressEvent)
userOne.printAll()

let userTwo = User(name: "Tereza", analyticEvent: fillSurveyEvent)
userTwo.printAll()


// Screen View Event

let viewMainScreen = ScreenViewEvent(
  type: ScreenEventType(
    name: "View Main Screen"),
  parameters: ["currentDate": Date(), "pageNumber": 3])

let userThree = User(name: "Nikola", analyticEvent: viewMainScreen)
userThree.printAll()

eventLogger.logEvent(buttonPressEvent)
eventLogger.logEvent(fillSurveyEvent)
eventLogger.logEvent(viewMainScreen)

print("Stored logs: \(eventLogger.calledLogs)")


