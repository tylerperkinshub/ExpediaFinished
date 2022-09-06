import UIKit

func getTime(s: String) -> Int {
    
    let alphabetArray = Array("abcdefghijklmnopqrstuvwxyz".lowercased())
    let sArray = Array(s.lowercased())
    
    var timeToCompute = 0
    
    var sArrayPointer = 0
    var letterPointer = 0
    
    var nextLetter = Character("a")
    var previousLetter = Character("a")
    
    for i in sArray {
        
        letterPointer = alphabetArray.firstIndex(of: i)!
        let evaluatedLetter = alphabetArray[letterPointer]
        
        switch evaluatedLetter {
        case "a":
            nextLetter = alphabetArray[1]
            previousLetter = alphabetArray[25]
        case "z":
            nextLetter = alphabetArray[0]
            previousLetter = alphabetArray[24]
        default:
            nextLetter = alphabetArray[letterPointer + 1]
            previousLetter = alphabetArray[letterPointer - 1]
            
        }
        
        if sArrayPointer == 0 {
            if sArray[1] == nextLetter || sArray[1] == previousLetter {
                timeToCompute += 1
            } else {
                timeToCompute += 2
            }
            
        } else if sArrayPointer == sArray.count - 1 {
            if sArray[sArrayPointer - 1] == nextLetter || sArray[sArrayPointer - 1] == previousLetter {
                timeToCompute += 1
            } else {
                timeToCompute += 2
            }
            
        } else {
            if sArray[sArrayPointer + 1] == nextLetter || sArray[sArrayPointer - 1] == previousLetter {
                timeToCompute += 1
            } else {
                timeToCompute += 2
            }
        }

        sArrayPointer += 1
    }
    
    return timeToCompute
}



func journey(path: [Int], maxStep: Int) -> Int {
            
    var runningTotal = Int()
    
    var pathPointer = 0
    var maxStepPointer = maxStep

    while path.count > pathPointer - 1 {

        var nextSetOfNumbers = path[pathPointer...]
        
        if path.count <= pathPointer + maxStep - 1 {
            nextSetOfNumbers = path[pathPointer...]
                           
        } else {
            nextSetOfNumbers = path[pathPointer...maxStepPointer - 1]

        }
        
        pathPointer += maxStep
        maxStepPointer +=  maxStep
                    
        var positiveInts = [Int]()
        var negativeInts = [Int]()
        
        for i in nextSetOfNumbers {
            if i >= 0 {
                positiveInts.append(i)
            } else {
                negativeInts.append(i)
            }
        }
        
        if positiveInts.isEmpty {
            runningTotal = runningTotal + negativeInts.max()!
            negativeInts = []


        } else {
            runningTotal = runningTotal + positiveInts.reduce(0, +)
            positiveInts = []

        }
                 
    }

    return runningTotal
}

journey(path: [1, -10, 10, 15, -3, -1, 25], maxStep: 3)


