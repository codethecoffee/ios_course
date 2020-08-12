//
//  main.c
//  BeerSong
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>

void singSongFor(int numberOfBottles) {
    // Base case: No more bottles left
    if (numberOfBottles == 0) {
        printf("There are no more bottles of beer left!\n");
    } else {
        printf("There are %d bottles of beer left.\n", numberOfBottles);
        numberOfBottles -= 1;
        printf("I drank one bottle, so now there are %d bottles of beer left.\n", numberOfBottles);
        singSongFor(numberOfBottles);
    }
}

int main(int argc, const char * argv[]) {
    singSongFor(4);
    return 0;
}
