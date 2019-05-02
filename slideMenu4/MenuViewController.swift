//
// MenuViewController.swift
//  slideMenu4
//
//  Created by Đặng Khánh  on 4/24/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit


struct UserInfo {
    var name: String?
    var age: String?
    var image: Data?
}


class MenuViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    
//    var delegates : ProfileViewControllerDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo.layer.cornerRadius = photo.frame.height / 2
        photo.layer.cornerRadius = photo.frame.width / 2
        photo.layer.masksToBounds = true
        

    }
    
    @IBAction func loginButton(_ sender: Any) {
        let userInfo = UserInfo(name: nameText.text, age: ageText.text, image: photo.image?.pngData())
        NotificationCenter.default.post(name: .sentUserInfo, object: userInfo, userInfo: nil)
        
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photo.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

    
}


