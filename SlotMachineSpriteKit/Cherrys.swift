import SpriteKit
import GameplayKit

class Cherrys: GameObject {
    
    init() {
        super.init(imageString: "cherry.gif", initialScale: 2.0)
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
        self.position.x = 0
        self.position.y = 0

    }
    
    override func Update() {
        CheckBounds()
    }
    
}
