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
        RomanNumber *roman = [[RomanNumber alloc] initWithValue:329];
        NSLog(@"%@", [roman stringValue]);
        RomanNumber *roman2 = [[RomanNumber alloc] initWithString:@"MMCMXVIII"];
        NSLog(@"%lu", [roman2 intValue]);
    }
    return 0;
}

