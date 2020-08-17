//
//  main.c
//  BMICalc
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

// typedef defines an alias for a type declaration so you can initialize
// new instances of it like you initialize other standard data types;
// no need for the wordy "struct MyStruct newInstance" syntax.
typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;
// Notice how type declarations end with the name of said struct
// and a semicolon


// Version of function that accepts a pointer to Person struct
float bodyMassIndexOf(Person *p) {
    return p->weightInKilos / (p->heightInMeters * p->heightInMeters);
}

int main(int argc, const char * argv[]) {

    // Allocate memory for one Person struct on the HEAP instead of on the stack
    Person *john = (Person *)malloc(sizeof(Person));
    // Now john is a pointer to a Person sized buffer on the heap
    // Let's fill in two members of the john struct
    john->heightInMeters = 96;
    john->heightInMeters = 1.8;
    
    // -> operator dereferences the pointer and gets the specified member
    
    // Calculate the BMI of the Person pointer john
    float johnBMI = bodyMassIndexOf(john);
    printf("John has a BMI of: %.2f\n", johnBMI);
    
    // Let the heap memory be recycled (prevent memory leaks!)
    free(john);
    
    // Forget where john was stored (since we got rid of it)
    john = NULL;
    
    return 0;
}
