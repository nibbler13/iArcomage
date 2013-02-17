//
//  CompletedView.m
//  iArcomage
//
//  Created by NIBBLER on 2/16/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "CompletedView.h"

@interface CompletedView ()

- (IBAction)closeButtonPressed:(id)sender;

@end

@implementation CompletedView

- (IBAction)closeButtonPressed:(id)sender
{
    [self.delegate closeButtonPressed];
}

@end
