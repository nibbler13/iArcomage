//
//  HelpTitlesView.m
//  iArcomage
//
//  Created by NIBBLER on 2/18/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "HelpTitlesView.h"

@implementation HelpTitlesView
{
    BOOL needToClose;
}

- (IBAction)helpButtonPressed:(id)sender
{
    [[NSUserDefaults standardUserDefaults] synchronize];
    BOOL hideHelpTitles = [[NSUserDefaults standardUserDefaults] boolForKey:@"hideHelpTitles"];
    
    if (!hideHelpTitles) {
        //NSLog(@"hideHelpTitles is yes");
        [self.helpButton setImage:[UIImage imageNamed:@"checkHelpButton2.png"] forState:UIControlStateNormal];
        [self.helpButton setImage:[UIImage imageNamed:@"checkHelpButton.png"] forState:UIControlStateSelected];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hideHelpTitles"];
    } else {
        //NSLog(@"hideHelpTitles is no");
        [self.helpButton setImage:[UIImage imageNamed:@"checkHelpButton.png"] forState:UIControlStateNormal];
        [self.helpButton setImage:[UIImage imageNamed:@"checkHelpButton2.png"] forState:UIControlStateSelected];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"hideHelpTitles"];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        if (CGRectContainsPoint(CGRectMake(20.0, 719.0, 100.0, 100.0), [touch locationInView:self])) {
            return;
        } else {
            needToClose = YES;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        if (CGRectContainsPoint(CGRectMake(20.0, 719.0, 100.0, 100.0), [touch locationInView:self])) {
            return;
        } else {
            if (needToClose) {
                [UIView animateWithDuration:1.0
                                      delay:0.0
                                    options:UIViewAnimationOptionCurveEaseInOut
                                 animations:^{
                                     self.alpha = 0.0;
                                 }completion:^(BOOL finished){
                                     [self removeFromSuperview];
                                 }];
            }
        }
    }
}

@end
