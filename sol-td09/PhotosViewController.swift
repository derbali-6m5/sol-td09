//
//  PhotosViewController.swift
//  sol-td09
//
//  Created by admin on 2023-04-19.
//

import UIKit
import BSImagePicker
import Photos

class PhotosViewController: UIViewController {

    @IBOutlet weak var lblNbPhotos: UILabel!
    
    let imagePicker = ImagePickerController()
    
    @IBOutlet weak var viewContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.settings.selection.min = 1
        imagePicker.settings.selection.max = 3
        
    }
    
    @IBAction func chargerPhotos(_ sender: Any) {
        presentImagePicker(imagePicker, select: {(asset) in
            
        }, deselect: {(asset) in
            
        }, cancel: {(assets) in
            
        }, finish: {(assets) in
            self.lblNbPhotos.text = "\(assets.count) photos choisies!"
            
            var space = 0
            let imgManager = PHImageManager.default()
            var imgOptions : PHImageRequestOptions{
                let options = PHImageRequestOptions()
                options.isSynchronous = true
                return options
            }
            for asset in assets{
                imgManager.requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: imgOptions){(image, info) in
                    let imgView = UIImageView(image: image)
                    imgView.frame = CGRect(x: 10, y: 10 + space, width: 200, height: 200)
                    imgView.layer.cornerRadius = 10
                    space = space + 200
                    self.viewContainer.addSubview(imgView)
                    
                }
            }
        })
    }
    
    

}
