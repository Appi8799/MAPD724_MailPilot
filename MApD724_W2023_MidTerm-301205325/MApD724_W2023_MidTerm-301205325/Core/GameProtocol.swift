//
//  GameProtocol.swift
//  MApD724_W2023_MidTerm-301205325
//
//  Created by Apeksha Parmar on 2023-03-05.
//

protocol GameProtocol
{
    // prevent an object from leaving the screen or detect that it has done so
    func CheckBounds()
    
    // Reset our GameObject offscreen
    func Reset()
    
    // Initialize properties of our Game Objects
    func Start()
    
    // Update will be called every Frame (60 times per second) = 16.666ms
    func Update()
}
