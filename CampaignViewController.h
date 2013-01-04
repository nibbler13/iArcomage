//
//  CampaignViewController.h
//  iArcomage
//
//  Created by NIBBLER on 12/13/12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartViewController.h"
#import "IncompletedGameViewController.h"

@interface CampaignViewController : UIViewController <StartViewControllerDelegate, IncompletedGameDelegate, UIPopoverControllerDelegate>

@property (nonatomic) BOOL soundsOn;

@end
