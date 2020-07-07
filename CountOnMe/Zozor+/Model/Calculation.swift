
import Foundation

//I used ViewController: ExtCalculation so i can afficher() and alert() can be use
protocol ExtCalculation {
    func afficher(resultat: String)
    func alert(titlle: String, message: String)
}

class Calculation {
    var extCalculation: ExtCalculation?
    var total = 0
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                
                // no numbers or operators, only calcul()
                if stringNumbers.count == 1 {
                    extCalculation?.alert(titlle: "Zéro", message: "Démarrez un nouveau calcul !")
                    
                }
                    
                // more than 1 number but stringNumber is empty because non number after an operator
                   else {
                    extCalculation?.alert(titlle: "Zéro", message: "Entrez une expression correcte !")
                    
                }
                
                return false
            }
        }
        
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            
            //we can't begin with an operator
            if stringNumber.isEmpty {
                extCalculation?.alert(titlle: "Zéro", message: "Expression incorrecte !")
                
                return false
            }
        }
        
        return true
    }
    // MARK: - Methods
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        updateDisplay()
    }
    
    
    func calculateTotal() {
        if !isExpressionCorrect {
            return
        }
        
        total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[i] == "+" {
                    total += number
                } else if operators[i] == "-" {
                    total -= number
                }
            }
        }
        extCalculation?.afficher(resultat: "\(total)")
        print("\(total)")
        stringNumbers = [String(total)]
        operators = ["+"]
        index = 0
    }
    
    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += operators[i]
            }
            // Add number
            text += stringNumber
        }
        extCalculation?.afficher(resultat: text)
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
        extCalculation?.afficher(resultat: "0")
    }
    
}
