import UIKit

func calculator(num1: Int, num2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(num1, num2)
}

// Let's shorten our multiply function as much as possible using CLOSURES!"

// Original version
func multiply (num1: Int, num2: Int) -> Int {
    return num1 * num2
}
calculator(num1: 2, num2: 3, operation: multiply(num1:num2:))

// Version 2: You don't have to specify data types in closures due to Type Inference.
// Let's remove them, both for the parameters and the return statement
calculator(num1: 2, num2: 3, operation: {(num1, num2) in return num1*num2})

// Version 3: You don't even have to put an explicit return statement.
// By default, it will return whatever you calculated.
calculator(num1: 2, num2: 3, operation: {(num1, num2) in num1*num2})

// Version 4: We can use ANONYMOUS PARAMETERS.
// $0 refers to the first parameter, $1 refers to the second, and so on.
calculator(num1: 2, num2: 3, operation: {$0 * $1})

// Version 5: If the last parameter is a closure, you can actually omit the parameter name
// and just add a trailing closure at the end
calculator(num1: 2, num2: 3) {$0 * $1}

// Note: To somebody who doesn't know Swift very well, version 5 probably looks like a bunch
// of nonsense.
