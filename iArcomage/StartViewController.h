//
//  StartViewController.h
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "PlayerModel.h"
#import "ComputerModel.h"
#import "OptionsViewController.h"
#import "BackgroundViewController.h"
#import "MusicViewController.h"
#import "QuitViewController.h"
#import "CompletedView.h"

@protocol StartViewControllerDelegate <NSObject>

- (void)levelCompletedWithVictory:(BOOL)victory;

@end

@interface StartViewController : UIViewController
    <
        PlayerModelDelegate,
        ComputerModelDelegate,
        UIAlertViewDelegate,
        OptionsViewControllerDelegate,
        BackgroundViewControllerDelegate,
        MusicViewControllerDelegate,
        quitViewControllerDelegate,
        CompletedViewDelegate
    >

@property (nonatomic, strong) id <StartViewControllerDelegate> delegate;

@property (nonatomic) BOOL isThisCampaignPlaying;
@property (nonatomic) NSString *levelName;
@property (nonatomic) NSInteger levelNumber;

@property (nonatomic) NSInteger initialTowerValue;
@property (nonatomic) NSInteger initialWallValue;
@property (nonatomic) NSInteger towerCampaignAim;
@property (nonatomic) NSInteger resourcesCampaignAim;

@property (nonatomic) NSString *backgroundImage;

@property (nonatomic) NSString *towerImage;
@property (nonatomic) NSString *wallImage;
@property (nonatomic) NSString *playerTowerHeadImage;
@property (nonatomic) NSString *computerTowerHeadImage;

@property (nonatomic) NSString *backgroundMusic;

@property (nonatomic) BOOL needToLoadGame;

@end
