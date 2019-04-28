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
    
    private var displaySize : CGRect!;
    private var minigameViewController : MinigameViewController!;
    
    public var homeScene = HomeScreen();
    
    override func loadView() {
        self.view = SKView();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        displaySize = UIScreen.main.bounds;
        
        minigameViewController = MinigameViewController();
        
        homeScene.size = CGSize(width: displaySize.width, height: displaySize.height);
        homeScene.gameViewController = self;
                
                // Present the scene
        if let view = self.view as! SKView? {
            
            view.presentScene(homeScene);
            
            
        }
        
    }

    override var shouldAutorotate: Bool {
        return true;
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .portrait
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func loadMinigame(sceneName: String){
        
        minigameViewController.loadScene(sceneName: sceneName)
        
        self.navigationController?.pushViewController(minigameViewController, animated: true);
        //self.present(minigameViewController, animated: true, completion: nil)
        
    }
    
}
