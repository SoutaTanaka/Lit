//
//  PhotoViewController.swift
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
            previewLayer.frame = CGRect(x: 0, y: 0, width: 375, height: 667)
            self.view.layer.addSublayer(previewLayer)
            self.session.startRunning()
        }
        catch {
            // handle error here
        }
        return true
    }
    
    
    //ここまでフォトライブラリ

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
