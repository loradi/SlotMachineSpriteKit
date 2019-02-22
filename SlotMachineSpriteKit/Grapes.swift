import SpriteKit
import GameplayKit

class Grapes: GameObject {
    
    init() {
        super.init(imageString: "grapes.gif", initialScale: 2.0)
        self.Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 1
    }
    
    
    override func CheckBounds() {
        // check the right boundary
        self.position.x = 200
        self.position.y = 200
        
    }
    
    override func Update() {
        CheckBounds()
    }
    
}
