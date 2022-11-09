//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Bertuğ Horoz on 6.11.2022.
//

import UIKit
//var globalName = ""
//var globalType = ""
//var globalAtmosphere = ""

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameText: UITextField!
    
    @IBOutlet weak var placeAtmospText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeImageView.isUserInteractionEnabled = true
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        placeImageView.addGestureRecognizer(gestureRec)
    }
    

    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if placeNameText.text != "" && placeTypeText.text != "" && placeTypeText.text != ""{
            
            if let chosenImage = placeImageView.image{
             
                let PlaceModel = placeModel.sharedInstance
                PlaceModel.placeName = placeNameText.text!
                PlaceModel.placeType = placeTypeText.text!
                PlaceModel.placeAtmos = placeAtmospText.text!
                PlaceModel.placeImage = chosenImage
            }
            self.performSegue(withIdentifier: "toMapVC", sender: nil)
        }else{
            let alert = UIAlertController(title: "Error", message: "Place Name/Type/Atmosphere?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
        
        
    }
    
    @objc func chooseImage(){
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }

}
