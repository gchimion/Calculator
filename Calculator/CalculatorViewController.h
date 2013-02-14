//
//  CalculatorViewController.h
//  Calculator
//
//  Created by georg chimion on 2/8/13.
//  Copyright (c) 2013 georgchimion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

- (IBAction)buttonPressed:(UIButton *)button;

- (IBAction)operationPressed:(UIButton *)button;

- (IBAction)clearLabel:(UIButton *)button ;

//- (IBAction)dotPressed:(UIButton *)button;

- (IBAction)equalPressed:(UIButton *)button; 

@end
