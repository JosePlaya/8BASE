////
//  ScanViewController.swift
//  MOZAPP
//
//  Created by Matias Barrientos on 8/15/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ScanViewController: UIViewController {
    
    // MARK: - Private Properties
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.qr]
    
    private var captureSession: AVCaptureSession?
    
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let deadlineTime = DispatchTime.now() + DispatchTimeInterval.milliseconds(500)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            let captureDevice = AVCaptureDevice.default(for: .video)
            
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice!)
                
                self.captureSession = AVCaptureSession()
                
                self.captureSession?.addInput(input)
                
                let captureMetadataOutput = AVCaptureMetadataOutput()
                self.captureSession?.addOutput(captureMetadataOutput)
                
                captureMetadataOutput.setMetadataObjectsDelegate(self, queue: .main)
                captureMetadataOutput.metadataObjectTypes = self.supportedCodeTypes
                
                self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession!)
                self.videoPreviewLayer?.videoGravity = .resizeAspectFill
                self.videoPreviewLayer?.frame = self.view.layer.bounds
                self.view.layer.addSublayer(self.videoPreviewLayer!)
                
                self.captureSession?.startRunning()
            } catch {
                print(error)
                return
            }
        }
    }
    
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension ScanViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 { return }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if supportedCodeTypes.contains(metadataObj.type) {
            captureSession?.stopRunning()
            // Infomracion del codigo QR
            //            print(metadataObj)
            print("HOLA")
            self.performSegue(withIdentifier: "mainSegue", sender: nil)
        } else {
            captureSession?.startRunning()
        }
    }
}
