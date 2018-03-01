//
// Created by Andrzej Grabowski on 01/03/2018.
// Copyright (c) 2018 Andrzej Grabowski. All rights reserved.
//

/*RomanNumber.h*/#import <Foundation/Foundation.h>

@interface RomanNumber: NSObject
- (NSUInteger) intValue;
- (id) initWithString: (NSString *)string;
- (id) initWithValue: (NSUInteger)value;
- (NSString *) stringValue;
@end