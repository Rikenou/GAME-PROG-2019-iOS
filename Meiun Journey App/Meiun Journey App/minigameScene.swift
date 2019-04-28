//
//  minigameScene.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 2019-04-28.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import SpriteKit
import GameplayKit

class minigameScene: SKScene {
    
    public var displaySize : CGSize!;
    
    public var ViewController : MinigameViewController!;
    
    override func sceneDidLoad() {
        
        var temp = UIScreen.main.bounds;
        displaySize = CGSize(width: temp.height, height: temp.width);
        self.size = CGSize(width: displaySize.width, height: displaySize.height);
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
}
