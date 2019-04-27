//
//  GameViewController.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 3/8/19.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var displaySize : CGRect!;

    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        displaySize = UIScreen.main.bounds;
        
        let scene = HomeScreen()
        scene.size = CGSize(width: displaySize.width, height: displaySize.height)
        
                
                // Present the scene
        if let view = self.view as! SKView? {
            
            view.presentScene(scene)
            
            
        }
        
    }

    override var shouldAutorotate: Bool {
        return false;
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
