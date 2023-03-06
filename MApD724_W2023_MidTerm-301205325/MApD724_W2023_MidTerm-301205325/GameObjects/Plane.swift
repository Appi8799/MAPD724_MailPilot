//
//  Island.swift
//  MApD724_W2023_MidTerm-301205325
//
//  Created by Apeksha Parmar on 2023-03-05.
//

import GameplayKit
import SpriteKit
 
class Plane : GameObject
{
    
    // Initializer
    init()
    {
        super.init(imageString: "planeRight", initialScale: 1.2)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Lifecycle functions
    override func CheckBounds()
    {
        // Task5
        // constrain on the botton boundry
        if(position.y <= -130)
        {
            position.y = -130
        }
        
        // Task 5
        // constrain on the top boundry
        if(position.y >= 130)
        {
            position.y = 130
        }
    }
    
    // Initialization
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
