//
//  ViewController.swift
//  Poke3D
//
//  Created by Admin on 4/22/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
       if let imagesTotrack = ARReferenceImage.referenceImages(inGroupNamed: "Books", bundle: Bundle.main) {
        
        configuration.trackingImages = imagesTotrack
        configuration.maximumNumberOfTrackedImages = 2
        
        print("Images added.")
        }
        
        

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            if imageAnchor.referenceImage.name == "Dredd_Book" {
                print("found Dredd")
                let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.02)
                 cube.firstMaterial?.diffuse.contents = UIColor.blue
                 let cubeNode = SCNNode(geometry: cube)
                
                cubeNode.eulerAngles.x = .pi / 2
                 
                 planeNode.addChildNode(cubeNode)
            }
            
            if imageAnchor.referenceImage.name == "Disaster_Book" {
                print("found disaster")
                let cone = SCNCone(topRadius: 0.1, bottomRadius: 0.2, height: 5)
                cone.firstMaterial?.diffuse.contents = UIColor.red
                let coneNode = SCNNode(geometry: cone)
                
                coneNode.eulerAngles.x = .pi / 2
                
                planeNode.addChildNode(coneNode)
            }
            
            
//            if let hammerScene = SCNScene(named: "art.scnassets/hammer.scn") {
//                let shpere = SCNSphere(radius: 0.5)
//                shpere.firstMaterial?.diffuse.contents = UIColor.blue
//                let node = SCNNode(geometry: shpere)
//
//               // let hammerNode = hammerScene.rootNode.childNodes.first!
//
//
//                planeNode.addChildNode(node)
//            }
        }
        
        return node
    }
    
}
