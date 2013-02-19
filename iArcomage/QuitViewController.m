//
//  QuitViewController.m
//  iArcomage
//
//  Created by NIBBLER on 2/16/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "QuitViewController.h"

@interface QuitViewController ()

- (IBAction)noButtonPressed:(id)sender;
- (IBAction)yesButtonPressed:(id)sender;

@end

@implementation QuitViewController

- (IBAction)noButtonPressed:(id)sender
{
    //NSLog(@"no");
    [self.delegate noQuitButtonPressed];
}

- (IBAction)yesButtonPressed:(id)sender
{
    //NSLog(@"yes");
    [self.delegate yesQuitButtonPressed];
}

@end
