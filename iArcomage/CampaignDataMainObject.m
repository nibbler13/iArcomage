//
//  CampaignDataMainObject.m
//  iArcomage
//
//  Created by NIBBLER on 2/9/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import "CampaignDataMainObject.h"
#import "CampaignData.h"

static CampaignDataMainObject *mainObject;

@implementation CampaignDataMainObject

+ (id)sharedCampaignDataMainObject
{
    if (mainObject == nil) {
        mainObject = [[CampaignDataMainObject alloc] init];
    }
    return mainObject;
}

+ (void)destroyCampaignDataMainObject
{
    if (mainObject != nil) {
        mainObject = nil;
    }
}

- (id)init
{
    NSLog(@"--- init CampaignDataMainObject");
    
    if ([super init] != nil) {
        
        self.taverns = [[NSMutableArray alloc] init];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self dataFilePath]]) {
            [self loadCampaignStatus];
        } else {
            NSString *path = [[NSBundle mainBundle] bundlePath];
            NSString *finalPath = [path stringByAppendingPathComponent:@"Taverns.plist"];
            NSArray *plistArray = [NSArray arrayWithContentsOfFile:finalPath];
            int x = [plistArray count];
            for (int i = 0; i < x; i++) {
                NSDictionary *info = plistArray[i];
                [self.taverns addObject:[self fillCampaignDataWithInfo:info]];
            }
        }
    }
    
    return self;
}

- (NSString*)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    return documentsDirectory;
}

- (NSString*)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"CampaignProgressSave.plist"];
}

- (void)loadCampaignStatus
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        self.taverns = [unarchiver decodeObjectForKey:@"taverns"];
        [unarchiver finishDecoding];
    }
}

- (CampaignData*)fillCampaignDataWithInfo:(NSDictionary*)info
{
    CampaignData *data = [[CampaignData alloc] init];
    data.tavernName = [info objectForKey:@"tavernName"];
    data.initialTower = [[info objectForKey:@"initialTower"] integerValue];
    data.initialWall = [[info objectForKey:@"initialWall"] integerValue];
    data.finalTower = [[info objectForKey:@"finalTower"] integerValue];
    data.finalResources = [[info objectForKey:@"finalResources"] integerValue];
    data.backgroundPicture = [info objectForKey:@"backgroundPicture"];
    data.towerBackground = [info objectForKey:@"towerBackground"];
    data.towerHeadPlayerBackground = [info objectForKey:@"towerHeadPlayerBackground"];
    data.towerHeadComputerBackground = [info objectForKey:@"towerHeadComputerBackground"];
    data.wallBackground = [info objectForKey:@"wallBackground"];
    data.backgroundMusic = [info objectForKey:@"backgroundMusic"];
    data.imageForTavern = [info objectForKey:@"imageForTavern"];
    data.isAchieved = [[info objectForKey:@"isAchieved"] boolValue];
    return data;
}

- (void)dealloc
{
    NSLog(@"--- dealloc CampaignDataMainObject");
}

@end
