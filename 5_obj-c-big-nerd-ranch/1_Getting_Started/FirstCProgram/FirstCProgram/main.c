//
//  main.c
//  FirstCProgram
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 20;
    int j = 25;
    int k = (i > j) ? 10 : 5;
    
    if (5 < j-k) {
        printf("The first expression is true.");
    } else if (j > i) {
        printf("The second expression is true.");
    } else {
        printf("Neither expression is true.");
    }
    
    // End this function and indicate success
    return 0;
}
