//
//  ViewController.swift
//  BeeImagePicker
//
//  Created by Chris Gonzalez on 8/15/16.
//  Copyright © 2016 Chris Gonzalez. All rights reserved.
//

import UIKit

class BeeImagePicker: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let BeeOverlay: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clearColor()
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let shootButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(white: 0.85, alpha: 0.7)
        button.layer.cornerRadius = 40
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var imagePicker: UIImagePickerController = {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.sourceType = .Camera
        imgPicker.allowsEditing = true
        imgPicker.cameraCaptureMode = .Photo
        imgPicker.showsCameraControls = false
        imgPicker.cameraDevice = .Rear
        return imgPicker
    }()
    
    let imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize: CGSize = UIScreen.mainScreen().bounds.size
        let cameraAsectRation: Float = 4.0 / 3.0
        let imageWidth = floorf(Float(screenSize.width) * cameraAsectRation)
        let scale = ceilf((Float(screenSize.height) / imageWidth) * 10.0) / 10.0
        
       // BeeOverlay.addSubview(shootButton)
       // setupShootButtonConstraints()
        BeeOverlay.frame.size.width = self.view.frame.size.width
        BeeOverlay.center = self.view.center
        BeeOverlay.frame.size.height = self.view.frame.size.height
        imagePicker.cameraOverlayView = BeeOverlay
        imagePicker.cameraViewTransform = CGAffineTransformMakeScale(CGFloat(scale), 1.5)
        presentViewController(imagePicker, animated: false, completion: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func setupShootButtonConstraints() {
//        shootButton.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -12).active = true
//        shootButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        shootButton.widthAnchor.constraintEqualToConstant(80).active = true
        shootButton.heightAnchor.constraintEqualToConstant(80).active = true
    }
    
    
}

