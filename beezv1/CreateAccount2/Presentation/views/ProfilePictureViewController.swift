//
//  ProfilePictureViewController.swift
//  beez
//
//  Created by Taison Digital on 16/09/2020.
//  Copyright © 2020 Taison Digital. All rights reserved.
//

import UIKit

class ProfilePictureViewController: UIViewController {

    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var viewLayer: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    
    let imagePicker = UIImagePickerController()
    let imageDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         initView()
        
        let imgState = UserDefaults.standard.bool(forKey: "imageState")
        
        if imgState == true {
            let bgImage = imageDefaults.imageForKey(key: "imageDefaults")!
             circleView.isHidden = true
            self.imgProfile.image = bgImage
            self.imgProfile.maskCircle(anyImage: imgProfile.image!)
     
        }
    }
    
    func initView(){
        btnGradient()
        progressView()
        getCircleView()
    }
    
    func progressView(){
         let colors = [hexStringToUIColor(hex: "#FFB439").cgColor, hexStringToUIColor(hex: "#FFED86").cgColor]
              
         viewLayer.layer.masksToBounds = true
         viewLayer.layerGradient(startPoint: .centerRight, endPoint: .centerLeft, colorArray: colors, type: .axial)
     }
    
    func getCircleView(){
        circleView.layer.cornerRadius = circleView.frame.size.width/2
        circleView.clipsToBounds = true

        circleView.layer.borderColor = hexStringToUIColor(hex: "#E7E9EB").cgColor
        circleView.layer.borderWidth = 5.0
    }
    
    private func btnGradient(){
        let colors = [hexStringToUIColor(hex: "#FFED86"), hexStringToUIColor(hex: "#FFB439")]
        btnContinue.setGradientBackgroundColors(colors, direction: .toBottomLeft, for: .normal)
        btnContinue.layer.cornerRadius = 5
        btnContinue.clipsToBounds = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnOpenGallery(_ sender: Any) {
        let alert = UIAlertController(title: NSLocalizedString("Please Select", comment: ""), message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Take Photo", comment: ""), style: .default , handler:{ [weak this = self] UIAlertAction in
            this?.showCamera(picker: self.imagePicker)
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Browse Photo", comment: ""), style: .default , handler:{ [weak this = self] UIAlertAction in
            this?.showPhotoGallery(picker: self.imagePicker)
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alert.popoverPresentationController?.sourceView = self.view
            alert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
            alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ProfilePictureViewController {
    fileprivate func showCamera(picker: UIImagePickerController) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.delegate = self;
            picker.sourceType = .camera
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    fileprivate func showPhotoGallery(picker: UIImagePickerController) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            picker.delegate = self;
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: nil)
        }
    }
}

extension ProfilePictureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                circleView.isHidden = true
                imgProfile.image = image
                self.imgProfile.maskCircle(anyImage: imgProfile.image!)
                
            UserDefaults.standard.set(true, forKey: "imageState")
            
                imageDefaults.setImage(image: image, forKey: "imageDefaults")
            
           //     image = self.imageOrientation(image)
    //            self.imagePickedBlock?(image)
        //        self.uploadSelectedImage(image: image, url: "\(Constants.Routes.BASE)/api/v3/ios/user/profile/updateProfile")
            } else {
                print("Something went wrong")
            }
            
            self.dismiss(animated: true, completion: nil)
        }
}

extension UIImageView {

func makeRounded() {
    let radius = self.frame.width/2.0
    self.layer.cornerRadius = radius
    self.layer.masksToBounds = true
   }
}
