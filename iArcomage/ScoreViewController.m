//
//  ScoreViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

- (IBAction)backButtonPressed:(id)sender;

@end

@implementation ScoreViewController

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
