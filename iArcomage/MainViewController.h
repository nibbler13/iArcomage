//
//  ViewController.h
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "OptionsViewController.h"
#import "IncompletedGameViewController.h"
#import "CampaignViewController.h"

@interface MainViewController : UIViewController
    <
    UIPopoverControllerDelegate,
    IncompletedGameDelegate,
    OptionsViewControllerDelegate,
    CampaignViewControllerDelegate
    >

@end
