//
//  PlayerModel.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "PlayerModel.h"
#import "ComputerModel.h"
#import "Card.h"
#import "CardsScope.h"

static PlayerModel *player;

@implementation PlayerModel
{
    ComputerModel *computer;
    CardsScope *cardsScope;
}

- (void)dealloc
{
    //NSLog(@"player dealloc");
}

#pragma mark -Initialization

+ (PlayerModel*)getPlayer
{
    //NSLog(@"get player");
    if (player == nil) {
        //NSLog(@"player Alloc");
        player = [[PlayerModel alloc] init];
    }
    return player;
}

+ (void)destroyPlayer
{
    //NSLog(@"destroy Player");
    if (player != nil) {
        player = nil;
    }
}

- (id)init
{
    //NSLog(@"init Player");
    if ([super init] != nil) {
        self.quarries = 1;
        self.magics = 1;
        self.dungeons = 1;
        self.bricks = 5;
        self.gems = 5;
        self.recruits = 5;
        self.wall = 20;
        self.tower = 20;
        self.isThatPlayerTurn = NO;
        self.shouldDiscardACard = NO;
        self.shouldPlayAgain = NO;
        self.cards = [[NSMutableArray alloc] initWithCapacity:6];
        self.soundsOn = YES;
        cardsScope = [CardsScope getCardsScope];
        cardsScope.soundsOn = self.soundsOn;
        self.cards = [NSMutableArray arrayWithObjects:cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, nil];
        computer = [ComputerModel getComputer];
    }
    return self;
}

#pragma mark -GamePlay

- (void)nextTurnIncreaseResource
{
    self.bricks += self.quarries;
    self.gems += self.magics;
    self.recruits += self.dungeons;
}

- (void)cardDiscarded:(NSInteger)number
{
    self.playedCard = number;
    self.isCardHasBeenDiscarded = YES;
}

- (void)cardSelected:(NSInteger)number
{
    self.playedCard = number;
    self.isCardHasBeenDiscarded = NO;
    [self processCard:number];
    
}

- (void)processCard:(NSInteger)number
{
    [[[self cards] objectAtIndex:number] initPlayerModel:self andComputerModel:computer];
    
    self.isThatPlayerTurn = YES;
    computer.isThatComputerTurn = NO;
    
    [self payForTheCard:number];
    if (self.soundsOn) {
        
        
        //NSLog(@"---player card name: %@", [[self.cards objectAtIndex:self.playedCard] cardName]);
        //NSLog(@"---card additional term: %d", [[self.cards objectAtIndex:self.playedCard] additionalTerms]);
        /*NSLog(@"---%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
              [[self.cards objectAtIndex:number] quarriesSelf],
              [[self.cards objectAtIndex:number] quarriesEnemy],
              [[self.cards objectAtIndex:number] magicsSelf],
              [[self.cards objectAtIndex:number] magicsEnemy],
              [[self.cards objectAtIndex:number] dungeonsSelf],
              [[self.cards objectAtIndex:number] dungeonsEnemy],
              [[self.cards objectAtIndex:number] bricksSelf],
              [[self.cards objectAtIndex:number] bricksEnemy],
              [[self.cards objectAtIndex:number] gemsSelf],
              [[self.cards objectAtIndex:number] gemsEnemy],
              [[self.cards objectAtIndex:number] recruitsSelf],
              [[self.cards objectAtIndex:number] recruitsEnemy],
              [[self.cards objectAtIndex:number] towerSelf],
              [[self.cards objectAtIndex:number] towerEnemy],
              [[self.cards objectAtIndex:number] wallSelf],
              [[self.cards objectAtIndex:number] wallEnemy]);*/
        
        if ([[self.cards objectAtIndex:number] quarriesSelf] > 0 ||
            [[self.cards objectAtIndex:number] magicsSelf] > 0 ||
            [[self.cards objectAtIndex:number] dungeonsSelf] > 0 ||
            [[self.cards objectAtIndex:number] quarriesEnemy] > 0 ||
            [[self.cards objectAtIndex:number] magicsEnemy] > 0 ||
            [[self.cards objectAtIndex:number] dungeonsEnemy] > 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfGeneralResource"];
        }
        if ([[self.cards objectAtIndex:number] quarriesSelf] < 0 ||
            [[self.cards objectAtIndex:number] magicsSelf] < 0 ||
            [[self.cards objectAtIndex:number] dungeonsSelf] < 0 ||
            [[self.cards objectAtIndex:number] quarriesEnemy] < 0 ||
            [[self.cards objectAtIndex:number] magicsEnemy] < 0 ||
            [[self.cards objectAtIndex:number] dungeonsEnemy] < 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfGeneralResource"];
        }
        if ([[self.cards objectAtIndex:number] bricksSelf] > 0 ||
            [[self.cards objectAtIndex:number] gemsSelf] > 0 ||
            [[self.cards objectAtIndex:number] recruitsSelf] > 0 ||
            [[self.cards objectAtIndex:number] bricksEnemy] > 0 ||
            [[self.cards objectAtIndex:number] gemsEnemy] > 0 ||
            [[self.cards objectAtIndex:number] recruitsEnemy] > 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfCommonResource"];
        }
        if ([[self.cards objectAtIndex:number] bricksSelf] < 0 ||
            [[self.cards objectAtIndex:number] gemsSelf] < 0 ||
            [[self.cards objectAtIndex:number] recruitsSelf] < 0 ||
            [[self.cards objectAtIndex:number] bricksEnemy] < 0 ||
            [[self.cards objectAtIndex:number] gemsEnemy] < 0 ||
            [[self.cards objectAtIndex:number] recruitsEnemy] < 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfCommonResource"];
        }
        if ([[self.cards objectAtIndex:number] towerSelf] > 0 ||
            [[self.cards objectAtIndex:number] wallSelf] > 0 ||
            [[self.cards objectAtIndex:number] towerEnemy] > 0 ||
            [[self.cards objectAtIndex:number] wallEnemy] > 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillIncreaseTowerOrWall"];
        }
        if ([[self.cards objectAtIndex:number] towerSelf] < 0 ||
            [[self.cards objectAtIndex:number] wallSelf] < 0 ||
            [[self.cards objectAtIndex:number] towerEnemy] < 0 ||
            [[self.cards objectAtIndex:number] wallEnemy] < 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillTakeDamage"];
        }
    }
    
    [[self.cards objectAtIndex:number] processCard];//ForPlayer:self andComputer:computer];
    
    self.isThatPlayerTurn = NO;
    
    [self.delegate needToCheckThatTheVictoryConditionsIsAchieved];
    
}

- (void)payForTheCard:(NSInteger)number
{
    if ([[[[self cards] objectAtIndex:number] cardColor] isEqualToString:@"Grey"]) {
        self.bricks -= [[[self cards] objectAtIndex:number] cardCost];
    }
    if ([[[[self cards] objectAtIndex:number] cardColor] isEqualToString:@"Blue"]) {
        self.gems -= [[[self cards] objectAtIndex:number] cardCost];
    }
    if ([[[[self cards] objectAtIndex:number] cardColor] isEqualToString:@"Green"]) {
        self.recruits -= [[[self cards] objectAtIndex:number] cardCost];
    }
}

- (void)getANewCard
{
    [self.cards replaceObjectAtIndex:self.playedCard withObject:cardsScope.getRandomCard];
}


@end
