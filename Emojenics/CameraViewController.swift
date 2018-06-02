//
//  CameraViewController.swift
//  Emojenics
//
//  Created by Vinay Krishna Gupta on 25/05/18.
//  Copyright © 2018 Vinay Krishna Gupta. All rights reserved.
//

import UIKit
import ImagePicker
import CropViewController

class CameraViewController: UIViewController, ImagePickerDelegate, CropViewControllerDelegate {
    let imagePickerController = ImagePickerController()
    var cropViewController = CropViewController(image: UIImage())
    public var FirstImage = UIImage()
    public var CroppedImage = UIImage()
    override func viewDidLoad() {
        imagePickerController.delegate = self
        cropViewController.delegate = self
        imagePickerController.imageLimit = 1
        imagePickerController.startOnFrontCamera = true
        imagePickerController.preferredImageSize = CGSize(width: 635, height: 540)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentCropViewController() {
        let image: UIImage = FirstImage
        cropViewController = CropViewController(image: image)
        cropViewController.delegate = self
        cropViewController.customAspectRatio = CGSize(width: 300, height: 300)
        
        cropViewController.aspectRatioLockEnabled = true
        present(cropViewController, animated: true, completion: nil)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        
        CroppedImage = image
        print(CroppedImage)
        cropViewController.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func openCameraButton(_ sender: UIButton)
    {
        self.present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func covertToEmojiee(_ sender: UIButton) {
        print(FirstImage);
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EmojieNewVC") as! EmojieeViewController
        vc.clickedImage1 = CroppedImage

        self.present(vc, animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage])
    {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage])
    {
       
        self.FirstImage = images[0];
        self.dismiss(animated: true, completion: nil)
        self.presentCropViewController()
        
    }
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "filterView")
        {
            if let destinationVc = segue.destination as? ViewController
            {
                destinationVc.clickedImage1 = FirstImage
            }
            
            
        }
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
