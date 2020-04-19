//
//  ViewController.swift
//  SeeFood
//
//  Created by Admin on 4/13/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
          imagePicker.delegate = self
          imagePicker.sourceType = .camera
          imagePicker.allowsEditing = false
          
      }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = userPickedimage
            guard let ciImage = CIImage(image: userPickedimage) else {
                fatalError("Failure converting UIImage to CIImage." )
            }
            
            detect(image: ciImage)
        }
             
        imagePicker.dismiss(animated: true, completion: nil)
        
       
    }
    
    func detect(image: CIImage) {
      
             guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
                 fatalError("Loading coreML model failed.")
             }
         let request = VNCoreMLRequest(model: model) { (request, error) in
             guard let results = request.results as? [VNClassificationObservation] else {
                 fatalError("Model failed to process image.")
             }
             
             if let firstResult = results.first {
                 if firstResult.identifier.contains("hotdog") {
                     self.navigationItem.title = "Hotdog!"
                 } else {
                     self.navigationItem.title = "Not Hotdog!"
                 }
                 
             }
         }
         
         let handler = VNImageRequestHandler(ciImage: image)
         do {
             try handler.perform([request])
         } catch {
             print(error)
         }
         
         
     }


}
