//
//  ViewController.swift
//  DataModelTest
//
//  Created by Hansub Yoo on 2018. 2. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var albumTitle: UILabel?
    @IBOutlet var albumArtist: UILabel?
    @IBOutlet var table: UITableView?
    
    var album: Album?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let songCount = album?.songList.count
        {
            return songCount
        }else
        {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongCell
        
        cell.songData = album?.songList[indexPath.row]
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        album = Album(dic: list)!
        
        if let list = album?.songList
        {
            for albumlist in list
            {
                print(albumlist)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

