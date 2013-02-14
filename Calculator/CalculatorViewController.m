//
//  CalculatorViewController.m
//  Calculator
//
//  Created by georg chimion on 2/8/13.
//  Copyright (c) 2013 georgchimion. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic, assign) BOOL isTyping;

//covers the case where user presses dot after an operation
@property (nonatomic, assign) BOOL isOperationLastPressed;



@end

@implementation CalculatorViewController

@synthesize display = _display;


- (IBAction)equalPressed:(UIButton *)button {
    self.display.text = [[NSString alloc]
                         initWithFormat:@"%f",
                         [CalculatorBrain computeOperation:[self.display.text floatValue]]
                         ];
    self.isTyping = NO;
}

- (IBAction)operationPressed:(UIButton *)button {
    [CalculatorBrain storeOperator:button.currentTitle andNumber:[self.display.text floatValue]];
    self.isTyping = NO;
    self.isOperationLastPressed = YES;
}


- (IBAction)clearLabel:(UIButton *)button {
    self.display.text = @"0";
    self.isTyping = YES;
}

- (IBAction)dotPressed:(UIButton *)button {
    
    if ([self.display.text rangeOfString:@"."].location == NSNotFound || self.isOperationLastPressed)
        // dot character not found in the display, so we can append it
    {
        if (self.isTyping)
        // if istyping then append the dot
        {
            self.display.text = [[NSString alloc] initWithFormat:@"%@%@",
                                 self.display.text,
                                 button.currentTitle
                                 ];
        } else {
        // new number then "." becomes "0."
            self.display.text = @"0.";
            self.isTyping = YES;
        }
        self.isOperationLastPressed = NO;
    }
  //  else {
        // dot pressed after an operation
  //  }
}

- (IBAction)buttonPressed:(UIButton *)button {    
    if ([self.display.text isEqualToString:@"0"] || !self.isTyping )
    // if display = 0 and new number then replace display with button title
    {
        self.display.text = button.currentTitle;
        self.isTyping = YES;
    }
    else
    //append
        self.display.text = [[NSString alloc] initWithFormat:@"%@%@",
                                                 self.display.text,
                                                 button.currentTitle
                                            ];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.isTyping = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
