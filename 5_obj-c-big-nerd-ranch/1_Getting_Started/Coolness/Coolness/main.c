//
//  main.c
//  Coolness
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 0;
    
    while (i < 20) {
        printf("%d: Suzy is Cool\n", i);
        i++;
    }
    printf("\n");
    for (int j=0; j < 20; j++) {
        printf("%d: Suzy is Cool again, for loop edition\n", j);
    }
    
    
    return 0;
}
