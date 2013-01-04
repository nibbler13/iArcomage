//
//  IncompletedGameViewController.m
//  iArcomage
//
//  Created by NIBBLER on 1/4/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "IncompletedGameViewController.h"
#import "StartViewController.h"

@interface IncompletedGameViewController ()

- (IBAction)yesButton:(id)sender;
- (IBAction)noButton:(id)sender;

@end

@implementation IncompletedGameViewController

- (IBAction)yesButton:(id)sender {
    [self.delegate needToLoadSavedGame:YES];
}

- (IBAction)noButton:(id)sender {
    [self.delegate needToLoadSavedGame:NO];
}

@end
