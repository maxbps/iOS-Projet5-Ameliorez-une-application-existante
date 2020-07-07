//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var calculation = Calculation()
    var audio = Audio()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculation.extCalculation = self
    }
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    // MARK: - Action
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                playAudio(sound: "1")
                calculation.addNewNumber(i)
            }
        }
    }
    
    @IBAction func plus() {
        if calculation.canAddOperator {
            playAudio(sound: "2")
            calculation.operators.append("+")
            calculation.stringNumbers.append("")
            calculation.updateDisplay()
        }
    }
    
    @IBAction func minus() {
        if calculation.canAddOperator {
            playAudio(sound: "2")
            calculation.operators.append("-")
            calculation.stringNumbers.append("")
            calculation.updateDisplay()
        }
    }
    
    @IBAction func equal() {
        playAudio(sound: "2")
        calculation.calculateTotal()
        
    }
    
    @IBAction func clear(_ sender: Any) {
        playAudio(sound: "3")
        calculation.clear()
    }
    
    func playAudio(sound: Character){
        DispatchQueue.main.async {
            let sound = sound
            self.audio.audio(sound: sound)
        }
    }
    
    
}

// I used an extension to use alert() and afficher() in the model with the protocol ExtCalculation
extension ViewController : ExtCalculation {
    func afficher(resultat: String){
        textView.text = resultat
    }
    
    func alert(titlle: String, message: String){
        let alertVC = UIAlertController(title: titlle, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
        
    }
}
