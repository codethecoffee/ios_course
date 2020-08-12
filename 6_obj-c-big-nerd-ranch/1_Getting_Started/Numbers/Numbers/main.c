//
//  main.c
//  Numbers
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>
// If you'll be using a lot of math functions (e.g., trig)
// make sure to include the math library
#include <math.h>

int main(int argc, const char * argv[]) {
    int x = 255;
    // %d: Prints an integer as a decimal number
    printf("x is %d.\n", x);
    
    // %o: Prints an integer in base 8 (octal)
    printf("x is %o in base-8\n", x);
    
    // %x: Prints an integer in base 16 (hexadecimal)
    printf("x is %x in hexadecimal\n", x);
    
    long z = 255;
    // What if the integer has a lot of bits?
    // Slip in an `l` (for long or) `ll` (for long long)
    // between the % sign and the format character (d, o, x, etc)
    printf("z is %ld.\n", z);
    printf("z is %lx as a long hexadecimal\n", z);
    
    // %u: Prints an unsigned decimal number
    unsigned long y = 255;
    printf("y is an unsigned integer: %lu.\n", y);
    printf("In octal, y is %lo\n", y);
    printf("In hexadecimal, y is %lx\n", y);
    
    
    // Floating Point Numbers
    // Floats are always signed, and come in multiple sizes
    float g; // 32 bits
    double h; // 64 bits
    long double bleh; // 128 bits
    
    double i = 12345.6789;
    printf("i is %.2f\n", i); // Decimal notation
    printf("i is %.2e\n", i); // Scientific notation
    
    // Basic Trig
    double radian = 1;
    double ans = sin(radian);
    printf("The sine of 1 radian is: %.3f\n", ans);
    
    return 0;
}
