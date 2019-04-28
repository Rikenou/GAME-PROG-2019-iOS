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
    
    var fingerOff = true;
    
    var quitTextBox : SKSpriteNode!;
    var Black : SKSpriteNode!;
    
    var blackTexture: [SKTexture]!;
    
    var onGround = true;
    var groundPos : CGPoint!;
    var blackSpeedY = CGFloat(0.0);
    
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
        
        var BlackImageName = "BlackIdleFrame";
        
        Black = SKSpriteNode.init(imageNamed: BlackImageName + String(0));
        Black.position = CGPoint(x: displaySize.width * 0.8, y: displaySize.height * 0.3);
        groundPos = Black.position;
        Black.size = CGSize(width: Black.size.width * 0.75, height: Black.size.height * 0.75);
        blackTexture = [SKTexture]();
        
        for i in 0 ..< 9 {
            
            blackTexture.append(SKTexture(imageNamed: BlackImageName + String(i)));
            
        }
        
        blackTexture.append(SKTexture(imageNamed: "JumpFrame0"));
        
        addChild(Black);
        
    }
    
    
    override func touchDown(atPoint pos : CGPoint) {
        
        if(pos.x >= quitTextBox.position.x - quitTextBox.size.width / 2 && pos.x <= quitTextBox.position.x + quitTextBox.size.width / 2 ){
            
            ViewController?.returnHome();
            
        }
            
        else{
            
            fingerOff = false;
            blackSpeedY = 100.0;
            
        }
        
    }
    
    override func touchMoved(toPoint pos : CGPoint) {
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        
        fingerOff = true;
        
    }
    
    var timer = CGFloat(0.0);
    var lastTime : TimeInterval!;
    var blackImageFrame = 0;
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if(lastTime == nil){
            
            lastTime = currentTime;
            
        }
        
        var deltaTime = CGFloat(currentTime - lastTime);
        lastTime = currentTime;
        
        var downForce = CGFloat(0.0);
        
        if(fingerOff && blackSpeedY > 0){
            
            downForce = CGFloat(15.0 * -9.8);
            
        }
        
        var s = blackSpeedY * deltaTime;
        s += 0.5 * (-9.8 * 5.0 + downForce) * deltaTime * deltaTime;
        
        Black.position.y += s;
        
        blackSpeedY += 0.5 * (-9.8 * 5.0 + downForce) * deltaTime;
        
        if(Black.position.y > groundPos.y){
            
            onGround = false;
            
        }
        else{
            
            if(onGround == false){
                
                blackImageFrame = 0;
                
            }
            
            if(Black.position.y < groundPos.y){
                
                Black.position.y = groundPos.y;
                
            }
            
            onGround = true;
            
        }
        
        if(onGround == true){
        
            if(timer < 0.1){
            
                timer += deltaTime;
            
            }
        
            else{
        
                if(blackImageFrame < 8){
            
                    blackImageFrame += 1;
            
                }
        
                else{
                    blackImageFrame = 0;
                }
        
                Black.texture = blackTexture[blackImageFrame];
                timer = 0.0;
            
            }
            
        }
        
        else{
            
            Black.texture = blackTexture[9];
            
        }
        
    }
    
}
