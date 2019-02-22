import SpriteKit
import GameplayKit

class Banana: GameObject {
    
    init() {
        super.init(imageString: "banana.gif", initialScale: 2.0)
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
        self.position.x = 100
        self.position.y = 100
        
    }
    
    override func Update() {
        CheckBounds()
    }
    
}
