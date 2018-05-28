//
//  CameraViewController.swift
//  Emojenics
//
//  Created by Vinay Krishna Gupta on 25/05/18.
//  Copyright © 2018 Vinay Krishna Gupta. All rights reserved.
//

import UIKit
import MetalPetal

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let sampleImage = UIImage.init(named: "samplemen")?.ciImage
        let inputImage = MTIImage.init(ciImage: sampleImage!)
        
        let filter = MTISaturationFilter()
        filter.saturation = 0
        filter.inputImage = inputImage
        
        let outputImage = filter.outputImage
      
        let mtimageview = MTIImageView.init(frame: self.view.bounds)
        self.view.addSubview(mtimageview)
        mtimageview.image = outputImage
    }
    
    func convert(cmage:CIImage) -> UIImage
    {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
