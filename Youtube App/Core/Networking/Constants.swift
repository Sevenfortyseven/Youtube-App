//
//  Constants.swift
//  Yapp
//
//  Created by aleksandre on 22.12.21.
//

import Foundation


struct Constants {
    
    static var API_KEY = "AIzaSyDnxMIe6xLrlloMXmMRk5InAKd1ULKmFsw"
    static var PLAYLIST_ID = "PL9D478540A2B59FF4"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(API_KEY)"
    static var YT_EMBED_URL = "https://www.youtube.com/embed/"
}

