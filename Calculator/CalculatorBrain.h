//
//  CalculatorBrain.h
//  Calculator
//
//  Created by georg chimion on 2/9/13.
//  Copyright (c) 2013 georgchimion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
+(void)storeOperator:(NSString*)operator andNumber:(float)number;
+(float)computeOperation:(float)number;
@end
