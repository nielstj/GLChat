//
//  DatesExtensions.swift
//  GLChat
//
//  Created by Daniel on 22/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation


public extension Date {
    func toShortTimeString(_ tz: TimeZone? = nil) -> String {
        //Get Short Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        if tz != nil {
            formatter.timeZone = tz
        }
        let timeString = formatter.string(from: self)
        //Return Short Time String
        return timeString
    }
}
