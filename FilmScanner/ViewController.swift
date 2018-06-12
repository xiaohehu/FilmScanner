//
//  ViewController.swift
//  FilmScanner
//
//  Created by Xiaohe Hu on 6/11/18.
//  Copyright © 2018 com.xiaohehu. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {
    
    @IBOutlet var uiv_imageView: UIImageView!
    @IBOutlet var uib_invertBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let filmImage = UIImage(named: "test_film.jpg") {
            uiv_imageView.image = filmImage
            uiv_imageView.contentMode = .scaleAspectFit
        }
    }
    
    @IBAction func TapInvert(_ sender: Any) {
        let initImage = CIImage(image: UIImage(named: "test_film.jpg")!)
        if let ivertFilter = CIFilter(name: "CIColorInvert") {
            ivertFilter.setValue(initImage, forKey: kCIInputImageKey)
            let invertedImage = UIImage(ciImage: ivertFilter.outputImage!)
            
            if let bwFilter = CIFilter(name: "CIWhitePointAdjust", ) {
                bwFilter.setValue(invertedImage, forKey: kCIInputImageKey)
                let finalImage = UIImage(ciImage: bwFilter.outputImage!)
                uiv_imageView.image = finalImage
            }
            
        }
        uiv_imageView.contentMode = .scaleAspectFit
        uiv_imageView.tintColor = UIColor.red
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

