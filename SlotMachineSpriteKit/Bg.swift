import SpriteKit
import GameplayKit

class Bg: GameObject {
    
    init() {
        super.init(imageString: "bg.png", initialScale: 2.0)
        self.Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 0
    }
    
    
    override func CheckBounds() {
        // check the right boundary
        self.position.x = 0
        self.position.y = 0
        
    }
    
    override func Update() {
        CheckBounds()
    }
    
}
