//
//  StartViewController.h
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "PlayerModel.h"
#import "ComputerModel.h"

@interface StartViewController : UIViewController
    <
        PlayerModelDelegate,
        ComputerModelDelegate,
        UIAlertViewDelegate
    >

@property (nonatomic) BOOL soundsOn;
@property (nonatomic) BOOL isThisCampaignPlaying;

@property (nonatomic) NSInteger initialTowerValue;
@property (nonatomic) NSInteger initialWallValue;
@property (nonatomic) NSInteger towerCampaignAim;

@property (nonatomic) NSString *backgroundImage;

@property (nonatomic) NSString *towerImage;
@property (nonatomic) NSString *wallImage;
@property (nonatomic) NSString *playerTowerHeadImage;
@property (nonatomic) NSString *computerTowerHeadImage;

@property (nonatomic) NSString *backgroundMusic;

@end
