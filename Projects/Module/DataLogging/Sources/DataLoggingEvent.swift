//
//  DataLoggingEvent.swift
//  DataLogging
//
//  Created by stat on 5/14/24.
//

public protocol DataLoggingEvent {
    
    typealias Name = String
    typealias Parameter = [String: Any]
    typealias Option = DataLoggingOption
    
    var eventName: Name { get }
    var eventParameter: Parameter? { get }
    var eventOption: Option { get }
}

public extension DataLoggingEvent {
    
    var eventParameter: Parameter? {
        return nil
    }
    
    var eventOption: Option {
        return [.analytics, .appsflyer]
    }
}
