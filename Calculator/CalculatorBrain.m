//
//  CalculatorBrain.m
//  Calculator
//
//  Created by georg chimion on 2/9/13.
//  Copyright (c) 2013 georgchimion. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

float static      memoryNumber = 0;
NSString static *memoryOperator;

+(float) computeOperation:(float)number
{
    if (!memoryOperator)
        return memoryNumber;
    
    if ([memoryOperator isEqualToString:@"+"])
        memoryNumber += number;
    else if ([memoryOperator isEqualToString:@"-"])
        memoryNumber -= number;
    else if ([memoryOperator isEqualToString:@"*"])
        memoryNumber *= number;
    else if ([memoryOperator isEqualToString:@"/"])
        memoryNumber /= number;
    
    memoryOperator = nil;
    return memoryNumber;
}

+(void)storeOperator:(NSString*)operator andNumber:(float)number;
{
    memoryNumber = number;
    memoryOperator = operator;
}

@end
