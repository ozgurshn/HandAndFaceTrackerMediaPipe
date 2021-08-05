//
//  ViewController.swift
//  Example
//
//  Created by Ozgur Sahin on 2020/04/02.
//  Copyright © 2020 Ozgur Sahin . All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleView: UISwitch!
    var previewLayer: AVCaptureVideoPreviewLayer!
    @IBOutlet weak var xyLabel:UILabel!
    @IBOutlet weak var featurePoint: UIView!
    let camera = Camera()
    lazy var faceTracker: FaceTracker = FaceTracker()
   lazy var handTracker: HandTracker = HandTracker()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camera.setSampleBufferDelegate(self)
        camera.start()
        faceTracker.startGraph()
        faceTracker.delegate = self
      

      handTracker.startGraph()
      handTracker.delegate = self
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
        faceTracker.processVideoFrame(pixelBuffer)
        handTracker.processVideoFrame(pixelBuffer)

//        DispatchQueue.main.async {
//            if !self.toggleView.isOn {
//                self.imageView.image = UIImage(ciImage: CIImage(cvPixelBuffer: pixelBuffer!))
//            }
//        }
    }
    


  

}

extension ViewController : TrackerDelegate
{

  func handTracker(_ handTracker: HandTracker!, didOutputLandmarks landmarks: [Landmark]!)  {
  }
  func handTracker(_ handTracker: HandTracker!, didOutputPixelBuffer pixelBuffer: CVPixelBuffer!) {

  }
}

extension ViewController:FaceTrackerDelegate
{
  func faceTracker(_ faceTracker: FaceTracker!, didOutputLandmarks faceArray: [Any]!) {
    print(faceArray.debugDescription)
  }

  func faceTracker(_ faceTracker: FaceTracker!, didOutputPixelBuffer pixelBuffer: CVPixelBuffer!) {

  }
}

//extension Collection {
//    /// Returns the element at the specified index if it is within bounds, otherwise nil.
//    subscript (safe index: Index) -> Element? {
//        return indices.contains(index) ? self[index] : nil
//    }
//}
//
//extension CGFloat {
//    func ceiling(toDecimal decimal: Int) -> CGFloat {
//        let numberOfDigits = CGFloat(abs(pow(10.0, Double(decimal))))
//        if self.sign == .minus {
//            return CGFloat(Int(self * numberOfDigits)) / numberOfDigits
//        } else {
//            return CGFloat(ceil(self * numberOfDigits)) / numberOfDigits
//        }
//    }
//}
//
//extension Double {
//    func ceiling(toDecimal decimal: Int) -> Double {
//        let numberOfDigits = abs(pow(10.0, Double(decimal)))
//        if self.sign == .minus {
//            return Double(Int(self * numberOfDigits)) / numberOfDigits
//        } else {
//            return Double(ceil(self * numberOfDigits)) / numberOfDigits
//        }
//    }
//}
