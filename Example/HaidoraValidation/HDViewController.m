//
//  HDViewController.m
//  HaidoraValidation
//
//  Created by mrdaios on 07/28/2015.
//  Copyright (c) 2015 mrdaios. All rights reserved.
//

#import "HDViewController.h"
#import <HaidoraValidation.h>

@interface HDViewController ()

@property (weak, nonatomic) IBOutlet UITextField *input1;
@property (weak, nonatomic) IBOutlet UITextView *input2;

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.input1.hd_validatorName = @"输入框";
    self.input2.hd_validatorName = @"输入框2";
    [self.input2.hd_validators addObject:[[REPresenceValidator alloc] init]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)validate:(id)sender
{
    NSLog(@"%@", [self.input1 hd_validationString]);
    NSLog(@"%@", [self.input2 hd_validationString]);
}

@end
