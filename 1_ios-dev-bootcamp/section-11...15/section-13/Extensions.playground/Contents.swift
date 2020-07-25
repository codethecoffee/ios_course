import UIKit

/*****************/
// SWIFT EXTENSIONS //
/*****************/
// Notes from section 13, lecture 168




// Ex 1: Extending a NATIVE SWIFT Data Type
// Let's add an extension to the round() method of the Double data type
var myDouble = 3.14159

// The existing round method only rounds to whole integers.
// What if I want to round to some specified number of decimal places?
myDouble.round() // returns 3

extension Double {
    func round(to places: Int) -> Double {
        let precisionNum = pow(10, Double(places))
        var n = self
        n = n * precisionNum
        n.round() // Rounds it down to a whole integer
        n = n / precisionNum
        return n
    }
}

var myDouble2 = 3.14159
myDouble2.round(to:3) // Returns 3.142. Success!




// Ex 2: Extending a UIKit Element
// Let's add an extension to a UIButton so that we can make a round button!
let button = UIButton(frame: CGRect(x:0, y:0, width: 50, height: 50))
button.backgroundColor = .red

// If we do not add an extension, we have the copy-paste the code below every
// single time we want a round button. Tedious!
button.layer.cornerRadius = 25
button.clipsToBounds = true

extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

let button2 = UIButton(frame: CGRect(x:0, y:0, width: 50, height: 50))
button2.backgroundColor = .blue
button2.makeCircular() // Now we just make to call the makeCircular method!




// Ex 3: Extending a PROTOCOL
// You can use extensions to provide DEFAULT IMPLEMENTATIONS OF METHODS/PROPERTIES.
// Now, classes with the CanFly protocol won't throw an error even if you don't provide
// a unique method definition.
protocol CanFly {
    func fly()
}

extension CanFly {
    func fly() {
        print("The object takes off into the air.")
    }
}

class Eagle: CanFly {
    func fly() {
        print("The eagle glides in the air.")
    }
}

class Plane: CanFly {
    func makeSound() {
        print("YaaaY")
    }
    
    // No need to explicitly define a fly() method! Gets the default implementation
    // specified by the CanFly extension
}

let myPlane = Plane()
myPlane.fly() // prints the default extension implementation

// This is why you don't need to add explicit implementations for all delegate
// methods; there are default implementations
