//
//  main.c
//  Addresses
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // &: Used to get the memory address of a variable
    int i = 17;
    int addressOfI = &i;
    // %p: printf token for displaying pointer value (memory address)
    printf("i stores its value at the address %p\n", &i);
    printf("i stores its value at the address %p\n", addressOfI);
    printf("This function starts at the address %p\n", main);
    
    float myFloat = 56.2;
    printf("%f takes up %lu bytes.\n", myFloat, sizeof(myFloat));
    
    
    
    return 0;
}
