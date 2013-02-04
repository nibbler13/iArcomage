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
    
    /*UIFont *font2 = [UIFont fontWithName:@"DarkCrystalScript" size:30.0f];
    
    [self.tavernNameLabel setFont:font2];
    [self.tavernNameLabel sizeToFit];
    
    [self.towerInitialLabel setFont:font2];
    [self.towerFinalLabel setFont:font2];
    [self.wallInitialLabel setFont:font2];
    [self.resourcesFinalLabel setFont:font2];*/
}

@end
