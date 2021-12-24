//
//  CacheManager.swift
//  Youtube App
//
//  Created by aleksandre on 24.12.21.
//

import Foundation

class CacheManager {
    
    private static var cache = [String: Data]()
    
    public static func setVideoCache(_ url: String, _ data: Data?) {
        // Store the image data and use URL as the key
        cache[url] = data
    }
    
    public static func getVideoCache(_ url: String) -> Data? {
        // Try to get data from the specified URL
        return cache[url]
    }
}
