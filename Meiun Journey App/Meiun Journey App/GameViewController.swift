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
    
    public var homeScene = HomeScreen();
    
    public var expEarned = 0;
    
    override func loadView() {
        self.view = SKView();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        displaySize = UIScreen.main.bounds;
        
        homeScene.size = CGSize(width: displaySize.width, height: displaySize.height);
        homeScene.gameViewController = self;
                
                // Present the scene
        if let view = self.view as! SKView? {
            
            view.presentScene(homeScene);
            
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
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
        
        var minigameViewController = MinigameViewController();
        minigameViewController.setMainController(mainControl: self);
        
        minigameViewController.loadScene(sceneName: sceneName)
        
        self.navigationController?.pushViewController(minigameViewController, animated: true);
        //self.present(minigameViewController, animated: true, completion: nil)
        
    }
    
}
