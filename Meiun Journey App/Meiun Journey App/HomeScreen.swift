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
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.blue;
        
        let hello : SKLabelNode!;
        hello = SKLabelNode(fontNamed: "Arial")

        hello.text = "Hello World";
        hello.position = CGPoint(x:100, y:100)

        addChild(hello);
        
//        let ico = SKSpriteNode.init(imageNamed: "BlackIco")
//        addChild(ico)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
}
