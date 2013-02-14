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
}


- (IBAction)clearLabel:(UIButton *)button {
    self.display.text = @"0";
    self.isTyping = NO;
}


- (IBAction)buttonPressed:(UIButton *)button {
    // Are you trying to add a 2nd '.' ?
    if ([button.currentTitle isEqualToString:@"."] && [self.display.text rangeOfString:@"."].location != NSNotFound && self.isTyping)
        return;
    
    // if display = 0 then replace display with button title
    if (!self.isTyping)
    {
        if ([button.currentTitle isEqualToString:@"."])
            self.display.text = @"0.";
        else
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
    self.isTyping = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
