//
//  ModelPractice.swift
//  LoginProject
//
//  Created by Hansub Yoo on 2018. 2. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

struct album {
    var albumInfo: albumInfo
    var songList: [song]
    
    init? (dic: [String:Any]) {
        guard let info = dic["albuminfo"] as? albumInfo else {return nil}
        guard let list = dic["songList"] as? [song] else {return nil}
        
        self.albumInfo = info
        self.songList = list
    }
}

struct albumInfo {
    var albumTitle: String
    var artist: String
    var genre: String
    
    init? (dic: [String: String]) {
        guard let title = dic["albumTitle"] else { return nil }
        guard let artist = dic["artist"] else { return nil }
        guard let genre = dic["genre"] else { return nil }
        
        self.albumTitle = title
        self.artist = artist
        self.genre = genre
    }
}

struct song {
    var songTitle: String
    var trackNum: Int
    var artist: String
    var writer: String
    var playTime: Int
    var playURL: String
    
    init? (dic: [String:Any]) {
        guard let title = dic["songTitle"] as? String else {return nil}
        guard let num = dic["trackNum"] as? Int else {return nil}
        guard let artist = dic["artist"] as? String else {return nil}
        guard let writer = dic["writer"] as? String else {return nil}
        guard let time = dic["playTime"] as? Int else {return nil}
        guard let url = dic["playURL"] as? String else {return nil}
        
        self.songTitle = title
        self.trackNum = num
        self.artist = artist
        self.writer = writer
        self.playTime = time
        self.playURL = url
    }
}
