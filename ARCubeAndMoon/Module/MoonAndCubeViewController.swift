//
//  ViewController.swift
//  ARCubeAndMoon
//
//  Created by Binaya on 04/11/2021.
//

import UIKit
import SceneKit
import ARKit

class MoonAndCubeViewController: UIViewController, ARSCNViewDelegate {

    //MARK: - @IBOutlet

    @IBOutlet var sceneView: ARSCNView!
    
    //MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true

        // Cube code: Note dimensions are in meters
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let cubeMaterial = SCNMaterial()
        cubeMaterial.diffuse.contents = UIColor.red
        cube.materials = [cubeMaterial]
        
        // 0 means center. Negative value in z position means moving away
        let cubeNode = SCNNode()
        cubeNode.position = SCNVector3(0, 0.1, -0.5)
        cubeNode.geometry = cube
        
        sceneView.scene.rootNode.addChildNode(cubeNode)
        sceneView.autoenablesDefaultLighting = true
        
        // Moon code.
        let moon = SCNSphere(radius: 0.2)
        
        let moonMaterial = SCNMaterial()
        moonMaterial.diffuse.contents = UIImage(named: "art.scnassets/moon.jpeg")
        moon.materials = [moonMaterial]
        
        let moonNode = SCNNode()
        moonNode.position = SCNVector3(0.4, 0.1, -0.5)
        moonNode.geometry = moon
        
        sceneView.scene.rootNode.addChildNode(moonNode)
        sceneView.autoenablesDefaultLighting = true
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
}
