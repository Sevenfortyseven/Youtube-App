//
//  Constants.swift
//  Yapp
//
//  Created by aleksandre on 22.12.21.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyDnxMIe6xLrlloMXmMRk5InAKd1ULKmFsw"
    static var PLAYLIST_ID = "PLjJzqDi1Y9u-HNrnB85pp6qrm8uAKcZ7O"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(API_KEY)"
}

