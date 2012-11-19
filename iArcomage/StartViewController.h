//
//  StartViewController.h
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerModel.h"
#import "ComputerModel.h"

@interface StartViewController : UIViewController
    <
        PlayerModelDelegate,
        ComputerModelDelegate,
        UIAlertViewDelegate
    >

@property (nonatomic) BOOL soundsOn;

@end
