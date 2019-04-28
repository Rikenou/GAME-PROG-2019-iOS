//
//  HomeScreen.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 3/14/19.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class HomeScreen: SKScene {
    
    public var gameViewController : GameViewController!;
    
    private var displaySize: CGRect!;
    
    private var agilityTouch = false;
    
    var PlayTextBox : SKSpriteNode!;
    
    private var ExpNumber : SKLabelNode!;
    
    override func didMove(to view: SKView) {
        displaySize = UIScreen.main.bounds;
        
        backgroundColor = SKColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0);
        /*
        let hello : SKLabelNode!;
        hello = SKLabelNode(fontNamed: "Arial")

        hello.text = "Hello World";
        hello.position = CGPoint(x:displaySize.width, y:displaySize.height);
        hello.fontColor = SKColor.white;

        addChild(hello);
        */
        
        var BlackPic : SKSpriteNode!;
        BlackPic = SKSpriteNode.init(imageNamed: "BlackNoBG");
        BlackPic.position = CGPoint(x: displaySize.width * 0.7, y: displaySize.height * 0.4);
        
        var scale = displaySize.height * 0.75 / BlackPic.size.height;
        
        BlackPic.size = CGSize(width: BlackPic.size.width * scale, height: BlackPic.size.height * scale);
        
        addChild(BlackPic);
        
        var ExpText : SKLabelNode;
        ExpText = SKLabelNode();
        
        ExpText.fontName = "Arial";
        ExpText.fontColor = SKColor(red: 1.0, green: 0.2, blue: 0.0, alpha: 1.0);
        ExpText.fontSize = 30.0;
        ExpText.position = CGPoint(x: 90, y: displaySize.height * 0.9);
        
        ExpText.text = "EXP Earned: ";
        
        addChild(ExpText);
        
        ExpNumber = SKLabelNode();
        
        ExpNumber.fontName = "Arial";
        ExpNumber.fontColor = SKColor(red: 1.0, green: 0.2, blue: 0.0, alpha: 1.0);
        ExpNumber.fontSize = 30.0;
        ExpNumber.position = CGPoint(x: ExpText.position.x + 120.0, y: displaySize.height * 0.9);
        
        ExpNumber.text = String(gameViewController.expEarned);
        
        addChild(ExpNumber);
        
        var PlayText : SKLabelNode;
        PlayText = SKLabelNode();
        
        PlayText.fontName = "Arial";
        PlayText.fontColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
        PlayText.fontSize = 20.0;
        PlayText.position = CGPoint(x: 85, y: ExpText.position.y - 70.0);
        
        PlayText.text = "Agility Training";
        
        PlayTextBox = SKSpriteNode.init(imageNamed: "IOSThin");
        
        PlayTextBox.position = CGPoint(x: PlayText.position.x + 2.5, y: PlayText.position.y + 7.5);
        PlayTextBox.size = CGSize(width: PlayTextBox.size.width / 2, height: PlayTextBox.size.height / 2);
        
        addChild(PlayTextBox);
        addChild(PlayText);
        
//        let ico = SKSpriteNode.init(imageNamed: "BlackIco")
//        addChild(ico)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if(pos.x >= PlayTextBox.position.x - PlayTextBox.size.width / 2 && pos.x <= PlayTextBox.position.x + PlayTextBox.size.width / 2  && pos.y >= PlayTextBox.position.y - PlayTextBox.size.height / 2 && pos.y <= PlayTextBox.position.y + PlayTextBox.size.height / 2){
            
            agilityTouch = true;
            
        }
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
        
        if(agilityTouch == true){
            
            agilityTouch = false;
            
            gameViewController.loadMinigame(sceneName: "PlatformJump");
            
            
        }
        
        ExpNumber.text = String(gameViewController.expEarned);
        
    }
    
    
}
