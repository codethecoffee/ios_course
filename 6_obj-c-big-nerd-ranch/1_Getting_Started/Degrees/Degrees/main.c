//
//  main.c
//  Degrees
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>

// A static variable
// These are essentially global variables that can only be accessed by
// functions in this current file

// If not given an initial value, these variables will automatically
// initialize to zero (NOT null)
static float lastTemperature;

float fahrenheitFromCelsius(float cel) {
    lastTemperature = cel;
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celsius is %f Fahrenheit\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[]) {
    float freezInC = 0;
    float freezeInF = fahrenheitFromCelsius(freezInC);
    printf("Water freezes at %f degrees Fahrenheit.\n", freezeInF);
    printf("The last temperature converted was %f.\n", lastTemperature);
    
    // Return 0 if the function executed successfully
    // Some programmers use values such as EXIST_SUCCESS, which is literally
    // just an alias of 0.
    return 0;
}
