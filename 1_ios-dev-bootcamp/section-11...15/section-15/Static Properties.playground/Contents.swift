import Foundation


// INSTANCE PROPERTY V.S. STATIC PROPERTY

struct MyStructure {
    let instanceProperty = "Hello there"
    static let typeProperty = "Bye there"
}

// In order to access an instance property, we must declare
// an instance of MyStructure first before we can access its value
let myStructure = MyStructure()
print(myStructure.instanceProperty)

// The code at line 19 throws the error: instance member 'instanceProperty' cannot be used on type 'MyStructure'
// That's fancy speak for saying that instanceProperty is tied to an INSTANCE of
// MyStructure, not the data type MyStructure itself. Therefore, we cannot acccess it
// print(MyStructure.instanceProperty)



// By contrast, we can access the type property without declaring an instance of MyStructure
// because it is a property associated with the TYPE, not the INSTANCE.
print(MyStructure.typeProperty) // Prints "Bye there" without throwing an error!


struct AnotherStructure {
    func instanceMethod() {
        print("I am tied to an instance of AnotherStructure!")
    }
    
    static func typeMethod() {
        print("I am tied to the data type AnotherStructure!")
    }
}

let anotherStructure = AnotherStructure()
anotherStructure.instanceMethod()
// The line of code below throws an error because instanceMethod() is not tied to the AnotherStructure data type
// AnotherStructure.instanceMethod()

AnotherStructure.typeMethod()
