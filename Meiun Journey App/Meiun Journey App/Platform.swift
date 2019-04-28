//
//  Platform.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 2019-04-27.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import SpriteKit
import GameplayKit

class Obstacle {
    
    private var y : Float!;
    private var vel : Float!;
    
    private var gameScene : SKScene!;
    
    public var image : SKSpriteNode;
    
    init(height: Float, speed: Float, scene: SKScene) {
        
        y = height;
        vel = speed;
        
        image = SKSpriteNode.init(imageNamed: "whiteSquare");
        image.position = CGPoint(x: -50, y: Int(y));
        
        gameScene = scene;
        gameScene.addChild(image);
        
    }
    
    public func update(deltaTime: CGFloat){
        
        image.position.x += deltaTime * CGFloat(vel);
        
    }
    
    public func destroy(){
    
        image.removeFromParent();
    
    }
    
}

class Platform: minigameScene {
    
    var fingerOff = true;
    var quitText : SKLabelNode!;
    var quitTextBox : SKSpriteNode!;
    var expText : SKLabelNode!;
    var Black : SKSpriteNode!;
    
    var blackTexture: [SKTexture]!;
    
    var onGround = true;
    var groundPos : CGPoint!;
    var blackSpeedY = CGFloat(0.0);
    
    var obstacleList: [Obstacle]!;
    
    override func sceneDidLoad() {
        
        super.sceneDidLoad();
        
        backgroundColor = SKColor.black;
        
        obstacleList = [Obstacle]();
        
        expText = SKLabelNode();
        expText.fontName = "Arial";
        expText.fontColor = SKColor(red: 1.0, green: 0.2, blue: 0.0, alpha: 1.0);
        expText.fontSize = 30.0;
        expText.position = CGPoint(x: displaySize.width * 0.7, y: displaySize.height * 0.85);
        
        addChild(expText);
        
        quitText = SKLabelNode();
        
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
            
            returnHome();
            
        }
            
        else if (onGround){
            
            fingerOff = false;
            blackSpeedY = 150.0;
            
        }
        
    }
    
    override func touchMoved(toPoint pos : CGPoint) {
    }
    
    override func touchUp(atPoint pos : CGPoint) {
        
        fingerOff = true;
        
    }
    var spawnTimer = CGFloat(0.0);
    var spawnInterval = CGFloat(0.0);
    var timer = CGFloat(0.0);
    var lastTime : TimeInterval!;
    var blackImageFrame = 0;
    var expEarn = CGFloat(0.0);
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if(lastTime == nil){
            
            lastTime = currentTime;
            
        }
        
        var deltaTime = CGFloat(currentTime - lastTime);
        lastTime = currentTime;
        
        if(spawnInterval == 0.0){
            
            spawnInterval = CGFloat.random(in: CGFloat(1.0) ..< CGFloat(5.0));
            
        }
        
        if(spawnTimer < spawnInterval){
            
            spawnTimer += deltaTime;
            
        }
        
        else{
            
            obstacleList.append(Obstacle(height: Float.random(in: Float(groundPos.y) ..< Float(displaySize.height)), speed: Float.random(in: 50.0 ..< 100.0), scene: self));
            
            spawnTimer = 0.0;
            spawnInterval = CGFloat.random(in: CGFloat(1.0) ..< CGFloat(5.0));
            
        }
        
        var blackPoint1 = CGPoint(x: Black.position.x + Black.size.width / 2, y: Black.position.y + Black.size.height / 2);
        var blackPoint2 = CGPoint(x: Black.position.x + Black.size.width / 2, y: Black.position.y - Black.size.height / 2);
        var blackPoint3 = CGPoint(x: Black.position.x - Black.size.width / 2, y: Black.position.y + Black.size.height / 2);
        var blackPoint4 = CGPoint(x: Black.position.x - Black.size.width / 2, y: Black.position.y - Black.size.height / 2);
        
        
        var killList = [Int]();
        for i in 0 ..< obstacleList.count {
            
            obstacleList[i].update(deltaTime: deltaTime);
            
            var point1 = CGPoint(x: obstacleList[i].image.position.x + obstacleList[i].image.size.width / 2, y: obstacleList[i].image.position.y + obstacleList[i].image.size.height / 2);
            var point2  = CGPoint(x: obstacleList[i].image.position.x + obstacleList[i].image.size.width / 2, y: obstacleList[i].image.position.y - obstacleList[i].image.size.height / 2);
            var point3  = CGPoint(x: obstacleList[i].image.position.x - obstacleList[i].image.size.width / 2, y: obstacleList[i].image.position.y + obstacleList[i].image.size.height / 2);
            var point4  = CGPoint(x: obstacleList[i].image.position.x - obstacleList[i].image.size.width / 2, y: obstacleList[i].image.position.y - obstacleList[i].image.size.height / 2);
            
            var collided = false;
            
            if(blackPoint1.x <= point1.x && blackPoint1.x >= point4.x && blackPoint1.y <= point1.y && blackPoint1.y >= point4.y){
                collided = true;
            }
            
            if(blackPoint2.x <= point1.x && blackPoint2.x >= point4.x && blackPoint2.y <= point1.y && blackPoint2.y >= point4.y){
                collided = true;
            }
            
            if(blackPoint3.x <= point1.x && blackPoint3.x >= point4.x && blackPoint3.y <= point1.y && blackPoint3.y >= point4.y){
                collided = true;
            }
            
            if(blackPoint4.x <= point1.x && blackPoint4.x >= point4.x && blackPoint4.y <= point1.y && blackPoint4.y >= point4.y){
                collided = true;
            }
            
            if(point1.x <= blackPoint1.x && point1.x >= blackPoint4.x && point1.y <= blackPoint1.y && point1.y >= blackPoint4.y){
                collided = true;
            }
            
            if(point2.x <= blackPoint1.x && point2.x >= blackPoint4.x && point2.y <= blackPoint1.y && point2.y >= blackPoint4.y){
                collided = true;
            }
            
            if(point3.x <= blackPoint1.x && point3.x >= blackPoint4.x && point3.y <= blackPoint1.y && point3.y >= blackPoint4.y){
                collided = true;
            }
            
            if(point4.x <= blackPoint1.x && point4.x >= blackPoint4.x && point4.y <= blackPoint1.y && point4.y >= blackPoint4.y){
                collided = true;
            }
            
            if(collided){
                
                returnHome();
                
            }
            
            if(obstacleList[i].image.position.x > displaySize.width + 50){
                
                obstacleList[i].destroy()
                killList.insert(i, at: 0)
                
            }
            
        }
        
        for o in killList{
            
            obstacleList.remove(at: o)
            
        }
        
        ViewController.expEarned += Float(deltaTime);
        expEarn += deltaTime;
        
        var downForce = CGFloat(0.0);
        
        if(fingerOff && blackSpeedY > 0){
            
            downForce = CGFloat(25.0 * -9.8);
            
        }
        
        var s = blackSpeedY * deltaTime;
        s += 0.5 * (-9.8 * 7.5 + downForce) * deltaTime * deltaTime;
        
        Black.position.y += s;
        
        blackSpeedY += 0.5 * (-9.8 * 10.0 + downForce) * deltaTime;
        
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
        
        quitTextBox.removeFromParent();
        addChild(quitTextBox);
        quitText.removeFromParent();
        addChild(quitText);
        
        expText.text = "Exp Earned: " + String(Int(expEarn));
        expText.removeFromParent();
        addChild(expText);
        
    }
    
}
