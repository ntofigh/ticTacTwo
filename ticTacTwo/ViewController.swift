//
//  ViewController.swift
//  ticTacTwo
//
//  Created by Anar on 7/2/16.
//  Copyright © 2016 Anar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1    //1 is for Os, 2 is for Xs)
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    // start with 0 for empty box, once tapped, game changes
    
    var gameActive = true
    // set active state to determine whether game is completed
    
    
    let winningCombinations = [[0,1,2],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
    // determine how to get 3 in a row

    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(sender: AnyObject) {
        //reset board
        
        gameActive = true
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        activePlayer = 1
        
        victoryLabel.hidden = true
        
        playAgainButton.hidden = true
        
        var buttonToClear : UIButton
        
        for var i = 0..< 9 ; i+=1 {
            buttonToClear = (view.viewWithTag(i) as! UIButton?)!
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
        
    }
    @IBOutlet weak var victoryLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    // add all the buttons to this function IBoutlet
    @IBAction func squarePress(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
        
        if activePlayer == 1 {
        
        sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            
            activePlayer = 2
            
            gameState[sender.tag] = activePlayer

        } else {
        
        sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            activePlayer = 1
            gameState[sender.tag] = activePlayer

        }
            for combination in winningCombinations {

                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                   
                    if (gameState[combination[0]] == 1){
                        victoryLabel.hidden = false
                        victoryLabel.text = "Ex's have won"
                    } else if (gameState[combination[0]] == 2){
                        victoryLabel.hidden = false
                        victoryLabel.text = "Oh's have won!"
                        
                    }
                    

                    playAgainButton.hidden = false
                    

//                  else {
//                        victoryLabel.hidden = false
//                        victoryLabel.text = "It's a draw!"
//                        gameActive = false
//                        playAgainButton.hidden = false
//                    }
                    
                    endGame()
                }
                
                
            }
            
            if gameActive == true {
                
                gameActive = false

                for buttonState in gameState {
                    if buttonState == 0 {
                        gameActive = true
                    }
            
                }
            
            if gameActive == false {
                victoryLabel.hidden = false
                
                victoryLabel.text = "It's a draw!"
                
            
                endGame()
                }
            
            }
        }
        
    }
    
    func endGame(){
    
            victoryLabel.hidden = false
            gameActive = false
            playAgainButton.hidden = false
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        victoryLabel.hidden = true
        playAgainButton.hidden = true

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

