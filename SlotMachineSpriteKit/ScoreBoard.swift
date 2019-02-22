import SpriteKit
import UIKit


class ScoreBoard {
    
    public static var ScoreLabel:SKLabelNode = SKLabelNode(text: "Score: 99999")
    public static var WinLabel:SKLabelNode = SKLabelNode(text: "You Win !!!!!")
    public static var BetLabel:SKLabelNode = SKLabelNode(text: "Bet: 0")
    public static var MoneyLabel:SKLabelNode = SKLabelNode(text: "Money: 0")
    
    
    // public static variables
    public static var Score:Int = 0 {
        didSet {
            ScoreLabel.text = "Score: " + String(Score)
        }
    }
    
    public static var Bet:Int = 0 {
        didSet {
            BetLabel.text = "Bet: " + String(Bet)
        }
    }
    public static var Money:Int = 0 {
        didSet {
            MoneyLabel.text = "Money: " + String(Money)
        }
    }
    
    public static var HighScore:Int = 0 {
        didSet {
            print("A High Score has been set")
        }
    }
    
}
