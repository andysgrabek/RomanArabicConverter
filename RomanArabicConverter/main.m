//
//  main.m
//  RomanArabicConverter
//
//  Created by Andrzej Grabowski on 28/02/2018.
//  Copyright © 2018 Andrzej Grabowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RomanNumber.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", [[[RomanNumber alloc] initWithValue:329] stringValue]);
        NSLog(@"%lu", [[[RomanNumber alloc] initWithString:@"MMCMXVIII"] intValue]);
        [[RomanNumber alloc] initWithString:@"MMMMMCMXVIII"];//will crash via NSAssert because of too many M letters
        [[RomanNumber alloc] initWithString:@"Y"];//will crash via NSAssert due to invalid roman digit
        [[RomanNumber alloc] initWithValue:5000];//will crash via NSAssert due to being to big for roman range
    }
    return 0;
}

