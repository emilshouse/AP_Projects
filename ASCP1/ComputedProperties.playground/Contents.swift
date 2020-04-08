import Foundation

var pizzaInInches: Int = 16 {
    willSet {
        
    }
    didSet {
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizza will be set to 18 inches.")
            pizzaInInches = 18
        }
    }
}
var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4
 
var numberOfSlices: Int {
    get{
        return pizzaInInches - 4
    }
    set {
        print("numberOfSlices now has a new Value which is \(newValue)")
    }
}


var numberOfPizza: Int {
    get {
        return (numberOfPeople * slicesPerPerson) / numberOfSlices
    }
    set {
         let totalSlices = numberOfSlices * newValue
        print("We have \(totalSlices) slices left.")
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

print(numberOfSlices)
print(numberOfPizza)

numberOfPizza = 4
print(numberOfPeople)

var name: String = "Kofi" {
    willSet {
        print("Name is about to be set to \(newValue).")
    }
    didSet {
        print("Name used to be \(oldValue).")
    }
}

name = "Emil"

pizzaInInches = 33
