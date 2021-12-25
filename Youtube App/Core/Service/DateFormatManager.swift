//
//  DateFormatManager.swift
//  Youtube App
//
//  Created by aleksandre on 25.12.21.
//

import Foundation

// Returns formatted date string

struct DateFormatManager {
    
    private static var dateFormatter =  DateFormatter()
    
    public static func formatDate(_ date: Date) -> String {
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}
