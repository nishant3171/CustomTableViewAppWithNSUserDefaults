//
//  PostImgVC.swift
//  Dirty Neighbours
//
//  Created by nishant punia on 19/01/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import UIKit

class PostImgVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
               
    }
    
    @IBAction func addImgBtnPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func makePostBtnPressed(sender: AnyObject) {
        if let text = titleText.text , let desc = descField.text , let image = postImg.image {
            
            let imgPath = DataService.instance.saveImageandCreatePath(image)
            let post = TableLayout(dirtyImg: imgPath, title: text, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    @IBAction func cancelBtnPressed(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImg.image = image
    }

}
