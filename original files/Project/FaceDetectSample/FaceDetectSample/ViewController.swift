//
//  ViewController.swift
//  FaceDetectSample
//
//  Created by Hansub Yoo on 2018. 3. 18..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var faceIndicatingView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let faceDetector = FaceDetector()
        let rect = faceDetector.getFaceRect(from: imageView.image!, imageView: imageView!)
        
        faceIndicatingView.frame = rect
        faceIndicatingView.layer.borderColor = UIColor.red.cgColor
        faceIndicatingView.layer.borderWidth = 1
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var img: UIImage = UIImage()
    
    
}

class FaceDetector {
    let context = CIContext()
    let opt = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
    var detector: CIDetector!
    init() {
        detector = CIDetector(ofType: CIDetectorTypeFace, context: context, options: opt)
    }
    
    func getFaceRect(from image: UIImage, imageView: UIImageView) -> CGRect {
        guard let ciimage = CIImage(image: image) else { return CGRect.zero }
        let ciImageSize = ciimage.extent.size
        var transform = CGAffineTransform(scaleX: 1, y: -1)
        transform = transform.translatedBy(x: 0, y: -ciImageSize.height)
        let features = detector.features(in: ciimage)
        // Apply the transform to convert the coordinates
        var faceViewBounds = features[0].bounds.applying(transform)
        // Calculate the actual position and size of the rectangle in the image view
        let viewSize = imageView.bounds.size
        let scale = min(viewSize.width / ciImageSize.width, viewSize.height / ciImageSize.height)
        let offsetX = (viewSize.width - ciImageSize.width * scale) / 2
        let offsetY = (viewSize.height - ciImageSize.height * scale) / 2
        faceViewBounds = faceViewBounds.applying(CGAffineTransform(scaleX: scale, y: scale))
        faceViewBounds.origin.x += offsetX
        faceViewBounds.origin.y += offsetY
        print(faceViewBounds)
        return faceViewBounds
    }
}

