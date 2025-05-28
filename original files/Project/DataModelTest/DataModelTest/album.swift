//
//  ModelPractice.swift
//  LoginProject
//
//  Created by Hansub Yoo on 2018. 2. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

struct Album {
    var albumInfo: AlbumInfo
    var songList: [Song]
    
    //딕셔너리를 받아오기때문에 무조건 옵셔널로 사용해야한다.
    init? (dic: [String:Any]) {
        //딕셔너리 데이터타입 데이터를 추출하여, 특정타입의 이니셜라이즈에 사용한다.
        //바로 Album데이터타입으로 추출하면 문제 발생, why? 추출한 것은 데이터의 구조는 같지만 songList나 info로 묶인 데이터형식이 아닌 그냥 일반 딕셔너리일 뿐이다.
        guard let info = dic["albumInfo"] as? [String: String] else {return nil}
        guard let list = dic["songList"] as? [[String: Any]] else {return nil}
        
        //추출된 데이터를 데이터타입에 맞게 이니셜라이즈 해준다.
        guard let infoInstance = AlbumInfo(dic: info) else { return nil }
        
        var songList: [Song] = []
        for song in list {
            if let instance = Song(dic: song) {
                songList.append(instance)
            }
        }
        self.albumInfo = infoInstance
        self.songList = songList
    }
}

struct AlbumInfo {
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

struct Song {
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

