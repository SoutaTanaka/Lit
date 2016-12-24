//  Lit
//
//  Created by 田中颯太 on 2016/11/23.
//  Copyright © 2016年 田中颯太. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoViewController: UIViewController {
    var stillImageOutput: AVCaptureStillImageOutput!
    var session: AVCaptureSession!
    let myAppFrameSize = UIScreen.main.nativeBounds.size
       @IBOutlet var photoview:UIView! {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.configureCamera()
    }
    // ここからフォトライぶらり
    
    func configureCamera() -> Bool {
        // init camera device
        var captureDevice: AVCaptureDevice?
        let devices: NSArray = AVCaptureDevice.devices() as NSArray
        
        // find back camera
        for device in devices {
            if (device as AnyObject).position == AVCaptureDevicePosition.back {
                captureDevice = device as? AVCaptureDevice
            }
        }
        
        if captureDevice != nil {
            // Debug
            print(captureDevice!.localizedName)
            print(captureDevice!.modelID)
        } else {
            print("Missing Camera")
            return false
        }
        
        // init device input
        do {
            let deviceInput: AVCaptureInput = try AVCaptureDeviceInput(device: captureDevice) as AVCaptureInput
            
            self.stillImageOutput = AVCaptureStillImageOutput()
            
            // init session
            self.session = AVCaptureSession()
            self.session.sessionPreset = AVCaptureSessionPresetPhoto
            self.session.addInput(deviceInput as AVCaptureInput)
            self.session.addOutput(self.stillImageOutput)
            
            // layer for preview
            let previewLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.session) as AVCaptureVideoPreviewLayer
            previewLayer.frame = CGRect(x: 0, y: 0, width: myAppFrameSize.width, height: myAppFrameSize.height + 120)
            previewLayer.position = CGPoint(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)! + (UIApplication.shared.statusBarFrame.height) + 120)
            self.view.layer.addSublayer(previewLayer)
            self.session.startRunning()
        }
        catch {
            // handle error here
        }
        return true
    }
    @IBAction func shotu (){
        save()
    }
    
    //ここまでフォトライブラリc
    func save (){
        let size:CGRect = CGRect(x: 0, y: 30, width: 200, height: 200)
        UIGraphicsBeginImageContext(size.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let caputure = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        UIImageWriteToSavedPhotosAlbum(caputure!, nil, nil, nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
