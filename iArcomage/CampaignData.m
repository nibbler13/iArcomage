//
//  CampaignData.m
//  iArcomage
//
//  Created by NIBBLER on 12/13/12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CampaignData.h"

@implementation CampaignData

- (id)initWithCoder:(NSCoder *)aDecoder
{
    //NSLog(@"CampaignData initWithCoder");
    if ((self = [super init])) {
        self.tavernName = [aDecoder decodeObjectForKey:@"tavernName"];
        self.initialTower = [aDecoder decodeIntegerForKey:@"initialTower"];
        self.initialWall = [aDecoder decodeIntegerForKey:@"initialWall"];
        self.finalTower = [aDecoder decodeIntegerForKey:@"finalTower"];
        self.finalResources = [aDecoder decodeIntegerForKey:@"finalResources"];
        self.backgroundPicture = [aDecoder decodeObjectForKey:@"backgroundPicture"];
        self.towerBackground = [aDecoder decodeObjectForKey:@"towerBackground"];
        self.towerHeadPlayerBackground = [aDecoder decodeObjectForKey:@"towerHeadPlayerBackground"];
        self.towerHeadComputerBackground = [aDecoder decodeObjectForKey:@"towerHeadComputerBackground"];
        self.wallBackground = [aDecoder decodeObjectForKey:@"wallBackground"];
        self.backgroundMusic = [aDecoder decodeObjectForKey:@"backgroundMusic"];
        self.imageForTavern = [aDecoder decodeObjectForKey:@"imageForTavern"];
        self.isAchieved = [aDecoder decodeBoolForKey:@"isAchieved"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //NSLog(@"CampaignData EncodeWithCoder");
    [aCoder encodeObject:self.tavernName forKey:@"tavernName"];
    [aCoder encodeInteger:self.initialTower forKey:@"initialTower"];
    [aCoder encodeInteger:self.initialWall forKey:@"initialWall"];
    [aCoder encodeInteger:self.finalTower forKey:@"finalTower"];
    [aCoder encodeInteger:self.finalResources forKey:@"finalResources"];
    [aCoder encodeObject:self.backgroundPicture forKey:@"backgroundPicture"];
    [aCoder encodeObject:self.towerBackground forKey:@"towerBackground"];
    [aCoder encodeObject:self.towerHeadPlayerBackground forKey:@"towerHeadPlayerBackground"];
    [aCoder encodeObject:self.towerHeadComputerBackground forKey:@"towerHeadComputerBackground"];
    [aCoder encodeObject:self.wallBackground forKey:@"wallBackground"];
    [aCoder encodeObject:self.backgroundMusic forKey:@"backgroundMusic"];
    [aCoder encodeObject:self.imageForTavern forKey:@"imageForTavern"];
    [aCoder encodeBool:self.isAchieved forKey:@"isAchieved"];
}

- (void)changeIsAchievedValueTo:(BOOL)newValue
{
    self.isAchieved = newValue;
}

@end
