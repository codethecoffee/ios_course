//
//  main.c
//  PBR
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>
#include <math.h>

void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr) {
    // Convert the number of meters into a float representation of feet
    double rawFeet = meters * 3.281;
    
    // How many complete feet (represent as unsigned int)
    unsigned int feet = (unsigned int)floor(rawFeet);
    
    // Store number of feet at the supplied address
    // Make sure to dereference pointer with preceding * so you are reassinging
    // the value at the ptr, not the memory address itself
    
    // Add a check, to make sure that the pointer has a valid memory address
    // Not NULL means it is not 0, which is an alias for BOOL
    if (ftPtr) {
        *ftPtr = feet;
    }
    
    // Calculate inches
    double fractionalFoot = rawFeet - feet;
    double inches = fractionalFoot * 12.0;
    
    if (inPtr) {
        // Store the number of inches at the supplied address
        printf("Storing %.2f to the address %p\n", inches, inPtr);
        *inPtr = inches;
    }
    
    
}

int main(int argc, const char * argv[]) {
    double pi = 3.14;
    double integerPart;
    double fractionPart;
    
    // Pass the address of integerPart as an argument using &
    fractionPart = modf(pi, &integerPart);
    
    // Find the value stored in integerPart using PASS-BY-REFERENCE
    // If you supply an address (a.k.a. a reference) the function puts the
    // data here. This is a useful way to get several pieces of data from a
    // function (since a C function can only return one value)
    printf("integerPart = %.0f, fractionPart=%.2f\n", integerPart, fractionPart);
    
    double meters = 3.0;
    unsigned int feet;
    double inches;
    
    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.lf meters is equal to %d feet and %.lf inches.", meters, feet, inches);
    
    return 0;
}
