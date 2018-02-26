//
//  ViewController.swift
//  DataModelTest
//
//  Created by Hansub Yoo on 2018. 2. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var albumTitle: UILabel?
    @IBOutlet var albumArtist: UILabel?
    @IBOutlet var table: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list: [String: Any] = ["albumInfo":["albumTitle":"2집 Oh!",
                                                "artist":"소녀시대",
                                                "genre":"댄스"],
                                   "songList":[["songTitle":"Oh!",
                                                "trackNum":1,
                                                "artist":"소녀시대",
                                                "writer":"김정배",
                                                "playTime":12340,
                                                "playURL":"http://music.naver.com/123"],
                                               ["songTitle":"Show! Show! Show!",
                                                "trackNum":2,
                                                "artist":"소녀시대",
                                                "writer":"김부민",
                                                "playTime":10130,
                                                "playURL":"http://music.naver.com/124"],
                                               ["songTitle":"웃자 (Be Happy)",
                                                "trackNum":4,
                                                "artist":"소녀시대",
                                                "writer":"이트라이브",
                                                "playTime":12134,
                                                "playURL":"http://music.naver.com/126"]
            ]
        ]
        
        let album: Album = Album(dic: list)!
        
        for albumlist in album.songList
        {
            print(albumlist)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

