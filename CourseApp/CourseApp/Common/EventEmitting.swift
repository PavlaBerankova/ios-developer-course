//
//  EventEmitting.swift
//  CourseApp
//
//  Created by Pavla Beránková on 30.05.2024.
//
import Combine

protocol EventEmitting {
    associatedtype Event

    var eventPublisher: AnyPublisher<Event, Never> { get }
}
