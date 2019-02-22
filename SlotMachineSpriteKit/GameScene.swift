
import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    
    var cherry: Cherrys?
    var banana: Banana?
    var grapes: Grapes?
    var initScore = 0
    var fruitNumber1 = 0
    var fruitNumber2 = 1
    var fruitNumber3 = 2
    var bet = SKLabelNode()
    var finalScore = SKLabelNode()
    var background = SKSpriteNode()
    var btn10 = SKSpriteNode()
    var btnMax =  SKSpriteNode()
    var btnSpinn = SKSpriteNode()
    
    var fruit1 = SKNode()
    var fruit2 = SKNode()
    var fruit3 = SKNode()
    
    

    
    
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add the BG to scene
        //self.backgroundColor = SKColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        let background = SKSpriteNode(imageNamed: "bg")
        background.anchorPoint = CGPoint.init(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 350)
        background.zPosition = 2
        background.name = "background"
        background.size = CGSize(width: 770, height: 1000)
        self.addChild(background)
        // add the 10 to scene
        let btn10 = SKSpriteNode(imageNamed: "bet10Button")
        btn10.anchorPoint = CGPoint.init(x: 0, y: 0)
        btn10.position = CGPoint(x: 0, y: 0)
        btn10.zPosition = 1
        btn10.name = "bet10Button"
        btn10.size = CGSize(width: 200, height: 200)
        self.addChild(btn10)
        // add the max to scene
        let btnMax = SKSpriteNode(imageNamed: "betMaxButton")
        btnMax.anchorPoint = CGPoint.init(x: 0, y: 0)
        btnMax.position = CGPoint(x: 200, y: 0)
        btnMax.zPosition = 1
        btnMax.name = "betMaxButton"
        btnMax.size = CGSize(width: 200, height: 200)
        self.addChild(btnMax)
        // add the spin to scene
        let btnSpinn = SKSpriteNode(imageNamed: "spinButton")
        btnSpinn.anchorPoint = CGPoint.init(x: 0, y: 0)
        btnSpinn.position = CGPoint(x: 400, y: 0)
        btnSpinn.zPosition = 1
        btnSpinn.name = "spinButton"
        btnSpinn.size = CGSize(width: 200, height: 200)
        self.addChild(btnSpinn)
        // add the score to scene
        let finalScore = SKLabelNode()
        finalScore.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + self.frame.height / 2.6)
        finalScore.text = "0"
        finalScore.zPosition = 5
        finalScore.fontSize = 50
        finalScore.fontName = "HelveticaNeue-Bold"
        finalScore.fontColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha:  1.0)
        self.addChild(finalScore)
        //add first fruit
        fruit1 = SKSpriteNode(imageNamed: "grapes.gif")
        fruit1.position = CGPoint(x: 140, y: 650)
        fruit1.xScale = CGFloat(integerLiteral: Int(2.7))
        fruit1.yScale = CGFloat(integerLiteral: Int(3.5))
        addChild(fruit1)
        //add second fruit
        fruit2 = SKSpriteNode(imageNamed: "banana.gif")
        fruit2.position = CGPoint(x: 340, y: 650)
        fruit2.xScale = CGFloat(integerLiteral: Int(2.7))
        fruit2.yScale = CGFloat(integerLiteral: Int(3.5))
        addChild(fruit2)
        //add third fruit
        fruit3 = SKSpriteNode(imageNamed: "cherry.gif")
        fruit3.position = CGPoint(x: 540, y: 650)
        fruit3.xScale = CGFloat(integerLiteral: Int(2.7))
        fruit3.yScale = CGFloat(integerLiteral: Int(3.5))
        addChild(fruit3)
        
        // Label Config and adding to the scene
        
        ScoreBoard.BetLabel.position.x = screenSize.width - 300.0
        ScoreBoard.BetLabel.position.y = screenSize.height + 115.0
        
        ScoreBoard.BetLabel.fontColor = UIColor.white
        ScoreBoard.BetLabel.fontSize = 48.0
        ScoreBoard.BetLabel.zPosition = 5
        ScoreBoard.BetLabel.fontName = "Arial Bold"
        ScoreBoard.Bet = 0
        
        
        addChild(ScoreBoard.BetLabel)
        ScoreBoard.ScoreLabel.position.x = screenSize.width + 50.0
        ScoreBoard.ScoreLabel.position.y = screenSize.height + 115.0
        
        ScoreBoard.ScoreLabel.fontColor = UIColor.white
        ScoreBoard.ScoreLabel.fontSize = 48.0
        ScoreBoard.ScoreLabel.zPosition = 5
        ScoreBoard.ScoreLabel.fontName = "Arial Bold"
        ScoreBoard.Score = 0
        
        
        addChild(ScoreBoard.ScoreLabel)
        
        ScoreBoard.MoneyLabel.position.x = screenSize.width - 270.0
        ScoreBoard.MoneyLabel.position.y = screenSize.height - 350.0
        
        ScoreBoard.MoneyLabel.fontColor = UIColor.white
        ScoreBoard.MoneyLabel.fontSize = 48.0
        ScoreBoard.MoneyLabel.zPosition = 5
        ScoreBoard.MoneyLabel.fontName = "Arial Bold"
        ScoreBoard.Money = 1000
        
        
        addChild(ScoreBoard.MoneyLabel)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        for touch in touches{
            //print("test")
            let location = touch.location(in: self)
            
            let touchedNode = atPoint(location)
            //print(touchedNode)
            if(touchedNode.name == "betMaxButton"){
                ScoreBoard.Bet = 100

            }
            if(touchedNode.name == "bet10Button"){
                ScoreBoard.Bet = 10
            }
            if(touchedNode.name == "spinButton"){
                fruitNumber1 = Int(arc4random_uniform(UInt32(1.advanced(by: 3))))
                fruitNumber2 = Int(arc4random_uniform(UInt32(1.advanced(by: 3))))
                fruitNumber3 = Int(arc4random_uniform(UInt32(1.advanced(by: 3))))
                //print("este es el numero1 ",fruitNumber1)
                //print("este es el numero2 ",fruitNumber2)
                //print("este es el numero3 ",fruitNumber3)
                if(fruitNumber1 == 1){
                    //fruit1.text = SKSpriteNode(imageNamed: "cherry.gif")
                    fruit1.run(SKAction.setTexture(SKTexture(imageNamed: "cherry.gif")))
                    
                }
                if(fruitNumber1 == 2){
                    
                    fruit1.run(SKAction.setTexture(SKTexture(imageNamed: "banana.gif")))
                }
                if(fruitNumber1 == 3){
                    fruit1.run(SKAction.setTexture(SKTexture(imageNamed: "grapes.gif")))
                    
                }
                if(fruitNumber1 == 0){
                    fruit1.run(SKAction.setTexture(SKTexture(imageNamed: "seven.gif")))
                }
                if(fruitNumber2 == 1){
                    //fruit1.text = SKSpriteNode(imageNamed: "cherry.gif")
                    fruit2.run(SKAction.setTexture(SKTexture(imageNamed: "cherry.gif")))
                    
                }
                if(fruitNumber2 == 2){
                    
                    fruit2.run(SKAction.setTexture(SKTexture(imageNamed: "banana.gif")))
                }
                if(fruitNumber2 == 3){
                    fruit2.run(SKAction.setTexture(SKTexture(imageNamed: "grapes.gif")))
                    
                }
                if(fruitNumber2 == 0){
                    fruit2.run(SKAction.setTexture(SKTexture(imageNamed: "seven.gif")))
                }
                if(fruitNumber3 == 1){
                    //fruit1.text = SKSpriteNode(imageNamed: "cherry.gif")
                    fruit3.run(SKAction.setTexture(SKTexture(imageNamed: "cherry.gif")))
                    
                }
                if(fruitNumber3 == 2){
                    
                    fruit3.run(SKAction.setTexture(SKTexture(imageNamed: "banana.gif")))
                }
                if(fruitNumber3 == 3){
                    fruit3.run(SKAction.setTexture(SKTexture(imageNamed: "grapes.gif")))
                    
                }
                if(fruitNumber3 == 0){
                    fruit3.run(SKAction.setTexture(SKTexture(imageNamed: "seven.gif")))
                }
                if(ScoreBoard.Bet == 0){
                    print("Ponga dinero")
                    
                }else{
                    
                    if (fruitNumber1 == fruitNumber2 && fruitNumber1 == fruitNumber3){
                        ScoreBoard.Score += 1
                        ScoreBoard.Money += ScoreBoard.Bet
                        
                        print("este es el numero1 ",fruitNumber1)
                        print("este es el numero2 ",fruitNumber2)
                        print("este es el numero3 ",fruitNumber3)
                    }else{
                        ScoreBoard.Money -= ScoreBoard.Bet
                        ScoreBoard.Bet = 0
                        print("resto dinero")
                    }
                }
            }

       
        }
    }

    
    override func update(_ currentTime: TimeInterval) {
    

        
    }
    func resetScene(){
        self.removeAllChildren()
        self.removeAllActions()
    }
    
}
