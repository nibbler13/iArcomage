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
#import "TavernInfoViewController.h"

@protocol CampaignViewControllerDelegate <NSObject>

- (void)gameHasBeenInitiated;
- (void)gameHasBeenCompleted;

@end

@interface CampaignViewController : UIViewController
    <
        StartViewControllerDelegate,
        IncompletedGameDelegate,
        TavernInfoViewControllerDelegate
    >

@property (nonatomic, strong) id <CampaignViewControllerDelegate> delegate;

@end
