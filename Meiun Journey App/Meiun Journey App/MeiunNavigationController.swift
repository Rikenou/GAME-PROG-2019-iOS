//
//  MeiunNavigationController.swift
//  Meiun Journey App
//
//  Created by Jonathan Leung on 2019-04-27.
//  Copyright © 2019 Jonathan Leung. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class MeiunNavigationController: UINavigationController{
    
    override var shouldAutorotate: Bool{
        
        return self.topViewController?.shouldAutorotate ?? false;
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        
        return self.topViewController?.supportedInterfaceOrientations ?? .allButUpsideDown;
        
    }
    
}
