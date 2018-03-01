//
// Created by Andrzej Grabowski on 01/03/2018.
// Copyright (c) 2018 Andrzej Grabowski. All rights reserved.
//
/*RomanNumber.m*/#import "RomanNumber.h"
static NSArray* letters;
static NSArray* values;

@interface RomanNumber()
@property NSString* romanString;
- (NSUInteger) romanLetterValue: (const char)letter;
- (NSUInteger) intValueFromString: (NSString *)string;
- (void) initArrays;
@end

@implementation RomanNumber
- (NSUInteger) intValue {
    return [self intValueFromString:self.romanString];
}
- (id) initWithString: (NSString *)string {
    [self initArrays];
    self.romanString = string;
    return self;
}
- (id)initWithValue:(NSUInteger)value {
    [self initArrays];
    NSString* roman = @"";
    NSUInteger n = value;
    for (NSUInteger i = 0; i < letters.count; ++i) {
        while (n >= [values[i] unsignedIntegerValue]) {
            roman = [roman stringByAppendingString:letters[i]];
            n -= [values[i] unsignedIntegerValue];
        }
    }
    self.romanString = roman;
    return self;
}
- (NSString *)stringValue {
    return self.romanString;
}
- (NSUInteger) intValueFromString:(NSString *)string {
    const char *s = [string cStringUsingEncoding:NSUTF8StringEncoding];
    NSUInteger result = 0, lastValue = NSUIntegerMax;
    for (char ch = *s; ch != 0; ch = *(++s)) {
        NSUInteger value = [self romanLetterValue:ch];
        if (value > lastValue) result += (value - 2 * lastValue);
        else result += value;
        lastValue = value;
    }
    return result;
}
- (void)initArrays {
    letters = @[@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];
    values = @[@1000, @900, @500, @400, @100, @90, @50, @40, @10, @9, @5, @4, @1];
    NSAssert(letters.count == values.count, @"Number of values mus correspond to the number of allowed tokens\n");
}
- (NSUInteger) romanLetterValue: (const char)letter {
    NSUInteger index = [letters indexOfObject:[NSString stringWithFormat:@"%c" , letter]];
    if (index == NSNotFound) {
        NSLog(@"%@", [NSString stringWithFormat:@"error: invalid Roman numeral letter '%c'\n", letter]);
        exit(1);
    }
    return [values[index] unsignedIntegerValue];
}
@end
