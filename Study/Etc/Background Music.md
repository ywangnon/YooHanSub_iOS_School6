# Background Music

app -> TARGETS -> Background Modes on -> Audio, AirPlay, and Picture in Picture 체크

import AVFoundation

    var queuePlayer = AVQueuePlayer()
    var playerLooper: AVPlayerLooper?
    
            guard let url = Bundle.main.url(forResource: "IU", withExtension: "mp3") else { return }
        let playerItem = AVPlayerItem(asset: AVAsset(url: url))
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        queuePlayer.play()