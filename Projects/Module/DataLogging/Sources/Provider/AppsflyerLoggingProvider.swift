//
//  AppsflyerLoggingProvider.swift
//  DataLogging
//
//  Created by stat on 5/14/24.
//

import Foundation
import AppsFlyerLib

struct AppsflyerLoggingProvider: DataLoggingProvider {
    
    func dataLoggingOption() -> DataLoggingOption {
        return .appsflyer
    }
    
    func dataLoggingSendEvent(_ event: DataLoggingEvent) {
        AppsFlyerLib.shared().logEvent(name: event.eventName, values: event.eventParameter)
    }
}

