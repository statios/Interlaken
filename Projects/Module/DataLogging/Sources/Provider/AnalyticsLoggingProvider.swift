//
//  AnalyticsLoggingProvider.swift
//  DataLogging
//
//  Created by stat on 5/14/24.
//

import Foundation
import FirebaseAnalytics

struct AnalyticsLoggingProvider: DataLoggingProvider {
    
    func dataLoggingOption() -> DataLoggingOption {
        return .analytics
    }
    
    func dataLoggingSendEvent(_ event: DataLoggingEvent) {
        Analytics.logEvent(event.eventName, parameters: event.eventParameter)
    }
}
