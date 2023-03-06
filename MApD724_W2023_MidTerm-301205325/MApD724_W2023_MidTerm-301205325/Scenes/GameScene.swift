//
//  GameScene.swift
//  MApD724_W2023_MidTerm-301205325
//
//  Created by Apeksha Parmar on 2023-03-05.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene
{
    
    var gameManager: GameManager?
    
    // Instance variables
    var ocean: Ocean?
    var island: Island?
    var plane: Plane?
    var clouds: [Cloud] = []
    
    override func didMove(to view: SKView) {
        print("didMove")
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        // Add ocean to the scene
        ocean = Ocean()
        
        // Task 2
        ocean?.position = CGPoint(x: 773, y: 0)
        addChild(ocean!)
        
        // Add island to the scene
        island = Island()
        addChild(island!)
        
        // Add plane to the scene
        plane = Plane()
        plane?.position = CGPoint(x: -320, y: 0)
        addChild(plane!)
        
        // Task 1
        // Add 2 cloud to the scene
        for index in 0...1
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
        // Sounds
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        self.addChild(engineSound)
        engineSound.autoplayLooped = true
        
        // Preload / prewarm impulse
        do
        {
            let sounds:[String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3")!
                let url: URL = URL(fileURLWithPath: path)
                let player: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
            }
        }
        catch
        {
            
        }
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        // Task 5
        plane?.TouchMove(newPos: CGPoint(x: -310, y: pos.y))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        // Task 5
        plane?.TouchMove(newPos: CGPoint(x: -310, y: pos.y))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        // Task 5
        plane?.TouchMove(newPos: CGPoint(x: -310, y: pos.y))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
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
    
    
    override func update(_ currentTime: TimeInterval)
    {
        if(UIDevice.current.orientation.isLandscape)
        {}
        else if(UIDevice.current.orientation.isPortrait){}
        
        ocean?.Update()
        island?.Update()
        plane?.Update()
        
        // Update each cloud in clouds
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: cloud)
        }
        
        CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: island!)
        
        if(ScoreManager.Lives < 1)
        {
            gameManager?.PresentEndScene()
        }
    }
}
