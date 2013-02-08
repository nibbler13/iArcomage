//
//  TavernInfoViewController.m
//  iArcomage
//
//  Created by NIBBLER on 1/13/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "TavernInfoViewController.h"

@interface TavernInfoViewController ()

- (IBAction)startButtonPressed:(id)sender;

@end

@implementation TavernInfoViewController

- (IBAction)startButtonPressed:(id)sender
{
    [self.delegate startButtonHasBeenPressed];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
