//
//  main.c
//  TurkeyTimer
//
//  Created by Suzy Lee on 8/12/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#include <stdio.h>

void showCookTimeForTurkey(int pounds) {
    int necessaryMinutes = 15 + 15 * pounds;
    printf("Cook for %d minutes.\n", necessaryMinutes);
    
    if (necessaryMinutes > 120) {
        int halfTime = necessaryMinutes / 2;
        printf("Rotate turkey after %d minutes.\n", halfTime);
    }
}

int main(int argc, const char * argv[]) {
    int totalWeight = 10;
    int gibletsWeight = 1;
    int turkeyWeight = totalWeight - gibletsWeight;
    showCookTimeForTurkey(turkeyWeight);
    
    return 0;
}
