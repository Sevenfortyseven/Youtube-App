//
//  ApiRequestDelegate.swift
//  Youtube App
//
//  Created by aleksandre on 23.12.21.
//

import Foundation

protocol ApiRequestDelegate {
    func videosFetched(_ videos: [Video])
}
