//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Sören Reinelt on 14.11.19.
//  Copyright © 2019 Sören Reinelt. All rights reserved.
//

import UIKit

class TicTacToeController: UIViewController {
    
    
    var activePlayer = 1 
    var gameStateArray = [0,0,0,0,0,0,0,0,0]
    var gameIsActive = true
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    

    @IBOutlet weak var whoWonLabel: UILabel!
    @IBOutlet weak var playAgainButtonOutlet: UIButton!
    
    
    @IBAction func fieldTappedAction(_ sender: AnyObject)
    { 
      
        // Wich Player tapped wich Field
        
        if (gameStateArray[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameStateArray[sender.tag-1] = activePlayer

            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "X.png"),for: UIControl.State())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "O.png"),for: UIControl.State())
                activePlayer = 1
            }
    
        }
        
        // Test who won
        
        for combination in winningCombinations
        {
      
            if (gameStateArray[combination[0]] != 0 && gameStateArray[combination[0]] == gameStateArray[combination[1]] && gameStateArray[combination[1]] == gameStateArray[combination[2]])
            {
                gameIsActive = false
                    
                    if (gameStateArray[combination[0]] == 1)
                    {
                        whoWonLabel.text = "X hat gewonnen!"
                    }
                    
                    else
                    {
                        whoWonLabel.text = "O has won!"
                    }
                
                playAgainButtonOutlet.isHidden = false
                whoWonLabel.isHidden = false
            }
        }
            
            
        gameIsActive = false
        
        // Test if every field is tapped
            
        for Value in gameStateArray
        {
            
            if Value == 0
            {
                gameIsActive = true
                break
            }
        }
        
        // Nobody won
        
        if gameIsActive == false
        {
            whoWonLabel.text = "Niemand hat gewonnen"
            whoWonLabel.isHidden = false
            playAgainButtonOutlet.isHidden = false
        }
    }
    
    
    
   
    @IBAction func playAgainButtonTappedAndSetEverythingAtTheBeginning(_ sender: Any)
    {
        
        gameStateArray = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        playAgainButtonOutlet.isHidden = true
        whoWonLabel.isHidden = true
        
        for everyField in 1...9
        {
            
            let field = view.viewWithTag(everyField) as! UIButton
            field.setImage(nil, for: UIControl.State())
        }
    }
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

