//
// Created by Andrzej Grabowski on 01/03/2018.
// Copyright (c) 2018 Andrzej Grabowski. All rights reserved.
//

#import "RomanNumber.h"
const static NSArray* letters;
const static NSArray* values;

@interface RomanNumber()
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
    _romanString = string;
    NSAssert([self intValue] > 0 && [self intValue] < 4999, @"Number outside of supported roman bounds");
    return self;
}
- (id)initWithValue:(NSUInteger)value {
    NSAssert(value > 0 && value < 4999, @"Number outside of supported roman bounds");
    [self initArrays];
    NSString* roman = @"";
    NSUInteger n = value;
    for (NSUInteger i = 0; i < letters.count; ++i) {
        while (n >= [values[i] unsignedIntegerValue]) {
            roman = [roman stringByAppendingString:letters[i]];
            n -= [values[i] unsignedIntegerValue];
        }
    }
    _romanString = roman;
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
- (void)initArrays { //technically it is possible to support numbers over 5000 when using additional digits or allowing the use of more than 4 consecutive letters M
    letters = @[@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];
    values = @[@1000, @900, @500, @400, @100, @90, @50, @40, @10, @9, @5, @4, @1];
    NSAssert(letters.count == values.count, @"Number of values must correspond to the number of allowed tokens\n");
}
- (NSUInteger) romanLetterValue: (const char)letter {
    NSUInteger index = [letters indexOfObject:[NSString stringWithFormat:@"%c" , letter]];
    NSAssert(index != NSNotFound, @"Invalid Roman numeral letter provided");
    return [values[index] unsignedIntegerValue];
}
@end
