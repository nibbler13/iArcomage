//
//  CampaignData.h
//  iArcomage
//
//  Created by NIBBLER on 12/13/12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CampaignData : NSObject

@property (nonatomic) NSString *tavernName;
@property (nonatomic) NSInteger initialTower;
@property (nonatomic) NSInteger initialWall;
@property (nonatomic) NSInteger finalTower;
@property (nonatomic) NSInteger finalResources;
@property (nonatomic) NSString *backgroundPicture;
@property (nonatomic) NSString *towerBackground;
@property (nonatomic) NSString *towerHeadPlayerBackground;
@property (nonatomic) NSString *towerHeadComputerBackground;
@property (nonatomic) NSString *wallBackground;
@property (nonatomic) NSString *backgroundMusic;
@property (nonatomic) NSString *imageForTavern;
@property (nonatomic) BOOL isAchieved;

@end
