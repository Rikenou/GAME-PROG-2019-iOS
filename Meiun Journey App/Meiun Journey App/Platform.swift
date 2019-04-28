//
//  Platform.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 2019-04-27.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import SpriteKit
import GameplayKit

class Platform: SKScene {
    
    private var displaySize : CGRect!;
    
    public var ViewController : MinigameViewController!;
    
    override func sceneDidLoad() {
        
        displaySize = UIScreen.main.bounds;        
        backgroundColor = SKColor.black;
        
        var quitText = SKLabelNode();
        
        quitText.fontName = "Arial";
        quitText.fontColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        quitText.fontSize = 20.0;
        quitText.position = CGPoint(x: displaySize.width * 0.15, y: displaySize.height / 0.8);
        
        quitText.text = "Quit";
        
        addChild(quitText);
        
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
