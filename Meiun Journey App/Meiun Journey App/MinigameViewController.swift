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
    
    private var MainController : GameViewController!;
    
    private var displaySize : CGRect!;
    
    public var expEarned : Float!;
    
    override func loadView() {
        self.view = SKView();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        self.definesPresentationContext = true;
        
        displaySize = UIScreen.main.bounds;

        expEarned = 0;
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated);
        
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation");
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        
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
        
        var NewScene = minigameScene();
        
        if(sceneName == "PlatformJump"){
            
            NewScene = Platform();
            
        }
        
        NewScene.ViewController = self;
        
        if let view = self.view as! SKView? {
            
            NewScene.scaleMode = SKSceneScaleMode.aspectFill;
            view.presentScene(NewScene, transition: transition);
            
            
        }
        
    }
    
    public func setMainController(mainControl: GameViewController){
        
        MainController = mainControl;
        
    }
    
    func returnHome(){
        
        MainController.expEarned += Int(expEarned);
        
        self.navigationController?.popViewController(animated: true);
        
    }
    
}
