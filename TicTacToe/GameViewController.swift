//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Memin on 23.07.2019.
//  Copyright © 2019 Memin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    var player1Points = 0, player2Points = 0
    
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        player1Score.text = String(player1Points)
        player2Score.text = String(player2Points)
        
    }
   
    @IBAction func BtnAction(_ sender: Any) {
    
        if (gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true){
            
            gameState[(sender as AnyObject).tag-1] = activePlayer
            
            if (activePlayer == 1){
                (sender as AnyObject).setTitle("X",for: .normal)
                activePlayer = 2
            }
            else{
                (sender as AnyObject).setTitle("O",for: .normal)
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                
                gameIsActive = false
                
                if gameState[combination[0]] == 1{
                    player1Points+=1
                    player1Score.text = String(player1Points)
                    ToastView.shared.short(self.view, txt_msg: "Player 1 Win")
                    reset()
                    
                }
                else{
                    player2Points+=1
                    player2Score.text = String(player2Points)
                    ToastView.shared.short(self.view, txt_msg: "Player 2 Win")
                    reset()
                }
            }
        }
        gameIsActive = false
        
        for i in gameState{
            if i == 0 {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false {
            ToastView.shared.short(self.view, txt_msg: "It was a Draw")
            reset()
        }
    }
    
    @objc func reset(){
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle(nil, for: .normal)
        }
    }
    
    @IBAction func ResetBtn(_ sender: Any) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        player1Points = 0
        player1Score.text = String(player1Points)
        player2Points = 0
        player2Score.text = String(player2Points)
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle(nil, for: .normal)
        }
    }
}
