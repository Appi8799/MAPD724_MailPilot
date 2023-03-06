//
//  PlanePortrait.swift
//  MApD724_W2023_MidTerm-301205325
//
//  Created by Apeksha Parmar on 2023-03-05.
//

import GameplayKit
import SpriteKit

class PlanePortrait : GameObject
{
    // initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func CheckBounds()
    {
        // constrain on the left boundary
        if(position.x <= -310)
        {
            position.x = -310
        }
        
        // constrain on the right boundary
        if(position.x >= 310)
        {
            position.x = 310
        }
    }
    
    // initialization
    override func Start()
    {
        zPosition = 2
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}

