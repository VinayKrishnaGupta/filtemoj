//
//  CameraViewController.swift
//  Emojenics
//
//  Created by Vinay Krishna Gupta on 25/05/18.
//  Copyright © 2018 Vinay Krishna Gupta. All rights reserved.
//

import UIKit
import CameraManager

class CameraViewController: UIViewController {
    let cameraManager = CameraManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraManager.cameraDevice = .front
        cameraManager.addPreviewLayerToView(self.view)

        // Do any additional setup after loading the view.
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
