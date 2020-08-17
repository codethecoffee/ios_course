//
//  main.c
//  CountDown
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>
#import <stdlib.h>
#include <readline/readline.h>

int main(int argc, const char * argv[]) {
    printf("Where should we start counting down from?\n");
    char *strNum = readline(NULL);
    int intNum = atoi(strNum);
    
    while (intNum >= 0) {
        printf("%d\n", intNum);
        if (intNum % 5 == 0) {
            printf("Found one!\n");
        }
        intNum -= 3;
    }
    
}
