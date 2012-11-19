//
//  InfoViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

- (IBAction)backButtonPressed:(id)sender;

@end

@implementation InfoViewController

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
