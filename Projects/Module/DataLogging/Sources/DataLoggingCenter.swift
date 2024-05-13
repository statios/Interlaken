//
//  DataLoggingService.swift
//  DataLogging
//
//  Created by stat on 5/14/24.
//

import Foundation

public struct DataLoggingCenter {
    
    // Services for logging if you want to add more services just add them here
    private static var providers: [DataLoggingProvider] = [
        AnalyticsLoggingProvider(),
        AppsflyerLoggingProvider()
    ]
    
    // MARK: - Basic logging method
    
    /// This method sends the event to the services that are available in the provider wihtout any side effect
    public static func sendEvent(_ event: DataLoggingEvent) {
        
        providers.forEach { provider in
            if event.eventOption.contains(provider.dataLoggingOption()) {
                provider.dataLoggingSendEvent(event)
            }
        }
    }
}
