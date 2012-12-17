//
//  CardsScope.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CardsScope.h"


static CardsScope *cardsScope;

@implementation CardsScope
{
    SystemSoundID soundDamageID;
    SystemSoundID soundDealID;
    SystemSoundID soundGeneralResouceIncreaseID;
    SystemSoundID soundGeneralResourceDecreaseID;
    SystemSoundID soundCommonResourceIncreaseID;
    SystemSoundID soundCommonResourceDecreaseID;
    SystemSoundID soundTowerWallID;
    SystemSoundID soundDefeatID;
    SystemSoundID soundEvilLaughID;
}

#pragma mark -Initialization

+ (CardsScope*)getCardsScope
{
    //NSLog(@"getCardScope");
    if (cardsScope == nil) {
        //NSLog(@"cardScope alloc");
        cardsScope = [[CardsScope alloc] init];
    }
    return cardsScope;
}

+ (void)destroyCardsScope
{
    //NSLog(@"destroy cardsScope");
    if (cardsScope != nil) {
        cardsScope = nil;
    }
}

- (id)init
{
    //NSLog(@"init CardScope");
    if ([super init] != nil) {
        
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *finalPath = [path stringByAppendingPathComponent:@"CardsList.plist"];
        NSArray *plistArray  = [NSArray arrayWithContentsOfFile:finalPath];
        self.cards = [[NSMutableArray alloc] initWithCapacity:102];
        int x = [plistArray count];
        for (int i = 0; i < x; i++) {
            NSDictionary *info = [plistArray objectAtIndex:i];
            [self.cards addObject:[self fillCardSlotWithInfo:info]];
        }
        self.soundsOn = YES;
        
        [self loadSoundEffectWithName:@"damage.caf" forSoundID:&soundDamageID];
        [self loadSoundEffectWithName:@"deal.caf" forSoundID:&soundDealID];
        [self loadSoundEffectWithName:@"resb_downa.caf" forSoundID:&soundGeneralResourceDecreaseID];
        [self loadSoundEffectWithName:@"ress_upa.caf" forSoundID:&soundGeneralResouceIncreaseID];
        [self loadSoundEffectWithName:@"resb_down.caf" forSoundID:&soundCommonResourceDecreaseID];
        [self loadSoundEffectWithName:@"ress_up.caf" forSoundID:&soundCommonResourceIncreaseID];
        [self loadSoundEffectWithName:@"towerwall.caf" forSoundID:&soundTowerWallID];
        [self loadSoundEffectWithName:@"defeat.caf" forSoundID:&soundDefeatID];
        [self loadSoundEffectWithName:@"evillaugh.caf" forSoundID:&soundEvilLaughID];
    }
    return self;
}

- (void)dealloc
{
    //NSLog(@"cardScope dealloc");
    [self unloadSoundEffect];
}

- (Card*)fillCardSlotWithInfo:(NSDictionary*)info
{
    Card *card = [[Card alloc] init];
    card.cardName = [info objectForKey:@"cardName"];
    card.cardColor = [info objectForKey:@"cardColor"];
    card.cardDescription = [info objectForKey:@"cardDescription"];
    card.cardCost = [[info objectForKey:@"cardCost"] integerValue];
    card.quarriesSelf = [[info objectForKey:@"quarriesSelf"] integerValue];
    card.quarriesEnemy = [[info objectForKey:@"quarriesEnemy"] integerValue];
    card.magicsSelf = [[info valueForKey:@"magicsSelf"] integerValue];
    card.magicsEnemy = [[info valueForKey:@"magicsEnemy"] integerValue];
    card.dungeonsSelf = [[info valueForKey:@"dungeonsSelf"] integerValue];
    card.dungeonsEnemy = [[info valueForKey:@"dungeonsEnemy"] integerValue];
    card.bricksSelf = [[info valueForKey:@"bricksSelf"] integerValue];
    card.bricksEnemy = [[info valueForKey:@"bricksEnemy"] integerValue];
    card.gemsSelf = [[info valueForKey:@"gemsSelf"] integerValue];
    card.gemsEnemy = [[info valueForKey:@"gemsEnemy"] integerValue];
    card.recruitsSelf = [[info valueForKey:@"recruitsSelf"] integerValue];
    card.recruitsEnemy = [[info valueForKey:@"recruitsEnemy"] integerValue];
    card.wallSelf = [[info valueForKey:@"wallSelf"] integerValue];
    card.wallEnemy = [[info valueForKey:@"wallEnemy"] integerValue];
    card.towerSelf = [[info valueForKey:@"towerSelf"] integerValue];
    card.towerEnemy = [[info valueForKey:@"towerEnemy"] integerValue];
    card.additionalTerms =  [[info valueForKey:@"additionalTerms"] boolValue];
    card.cardWeight = 0;
    return card;
}

#pragma mark -GamePlay

- (Card*)getRandomCard
{
    NSInteger random = (1 + arc4random()%([self.cards count] -1));
    return [self.cards objectAtIndex:random];
}

#pragma mark -SoundEffects

- (void)loadSoundEffectWithName:(NSString*)name forSoundID:(SystemSoundID*)soundID
{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSURL *fileURL = [NSURL fileURLWithPath:path isDirectory:NO];
    if (fileURL == nil) {
        NSLog(@"NSURL is nil for path: %@", path);
        return;
    }
    OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, soundID);
    if (error != kAudioServicesNoError) {
        NSLog(@"Error code %ld loading sound at path: %@", error, path);
        return;
    }
}

- (void)unloadSoundEffect
{
    AudioServicesDisposeSystemSoundID(soundDealID);
    soundDealID = 0;
}

- (void)playDealSoundEffectForEvent:(NSString *)event
{
    if (self.soundsOn) {
        //NSLog(@"===========sounds on===========");
        if ([event isEqualToString:@"WillTakeACard"]) {
            AudioServicesPlaySystemSound(soundDealID);
        } else if ([event isEqualToString:@"WillTakeDamage"]) {
            AudioServicesPlaySystemSound(soundDamageID);
        } else if ([event isEqualToString:@"WillIncreaseTowerOrWall"]) {
            AudioServicesPlaySystemSound(soundTowerWallID);
        } else if ([event isEqualToString:@"WillIncreaseSelfGeneralResource"]) {
            AudioServicesPlaySystemSound(soundGeneralResouceIncreaseID);
        } else if ([event isEqualToString:@"WillDecreaseSelfGeneralResource"]) {
            AudioServicesPlaySystemSound(soundGeneralResourceDecreaseID);
        } else if ([event isEqualToString:@"WillIncreaseSelfCommonResource"]) {
            AudioServicesPlaySystemSound(soundCommonResourceIncreaseID);
        } else if ([event isEqualToString:@"WillDecreaseSelfCommonResource"]) {
            AudioServicesPlaySystemSound(soundCommonResourceDecreaseID);
        } else if ([event isEqualToString:@"PlayerWin"]) {
            AudioServicesPlaySystemSound(soundEvilLaughID);
        } else if ([event isEqualToString:@"PlayerLose"]) {
            AudioServicesPlaySystemSound(soundDefeatID);
        } else {
            NSLog(@"===========  Unknown sound!!!");
        }
    } else {
        NSLog(@"===========sounds off===========");
    }
}

@end
