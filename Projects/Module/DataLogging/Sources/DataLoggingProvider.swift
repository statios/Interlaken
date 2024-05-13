//
//  DataLoggingProvider.swift
//  DataLogging
//
//  Created by stat on 5/14/24.
//

import Foundation

public struct DataLoggingOption: OptionSet {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let analytics = DataLoggingOption(rawValue: 1 << 0)
    
    public static let appsflyer = DataLoggingOption(rawValue: 1 << 1)
    
    public static let all: DataLoggingOption = [.analytics, .appsflyer]
}

protocol DataLoggingProvider {
    
    func dataLoggingOption() -> DataLoggingOption
    
    func dataLoggingSendEvent(_ event: DataLoggingEvent)
}
