//
//  Platform.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 2019-04-27.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import SpriteKit
import GameplayKit

class Platform: minigameScene {
    
    var quitTextBox : SKSpriteNode!;
    
    override func sceneDidLoad() {
        
        super.sceneDidLoad();
        
        backgroundColor = SKColor.black;
        
        var quitText = SKLabelNode();
        
        quitText.fontName = "Arial";
        quitText.fontColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        quitText.fontSize = 30.0;
        quitText.position = CGPoint(x: 50, y: displaySize.height * 0.85);
        
        quitText.text = "Quit";
        
        
        quitTextBox = SKSpriteNode.init(imageNamed: "IOSFat");
        
        quitTextBox.position = CGPoint(x: quitText.position.x, y: quitText.position.y + 10.0);
        quitTextBox.size = CGSize(width: quitTextBox.size.width / 4, height: quitTextBox.size.height / 4);
        
        addChild(quitTextBox);
        addChild(quitText);
        
    }
    
    
    override func touchDown(atPoint pos : CGPoint) {
        
        if(pos.x >= quitTextBox.position.x - quitTextBox.size.width / 2 && pos.x <= quitTextBox.position.x + quitTextBox.size.width / 2 ){
            
            ViewController?.returnHome();
            
        }
        
    }
    
    override func touchMoved(toPoint pos : CGPoint) {
    }
    
    override func touchUp(atPoint pos : CGPoint) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
    
}
