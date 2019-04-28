//
//  MinigameViewController.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 2019-04-27.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class MinigameViewController: UIViewController {
    
    private var displaySize : CGRect!;
    private var platformScene = Platform();
    
    override func loadView() {
        self.view = SKView();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        displaySize = UIScreen.main.bounds;
        
        platformScene.ViewController = self;
        platformScene.size = CGSize(width: displaySize.width, height: displaySize.height);
        
    }
    
    override var shouldAutorotate: Bool {
        return true;
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .landscape
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func loadScene(sceneName: String){
        
        var transition = SKTransition.fade(withDuration: 1);
        
        var NewScene = SKScene();
        
        if(sceneName == "PlatformJump"){
            
            NewScene = platformScene;
            
        }
        
        if let view = self.view as! SKView? {
            
            NewScene.scaleMode = SKSceneScaleMode.aspectFill;
            view.presentScene(NewScene, transition: transition);
            
            
        }
        
    }
    
}
