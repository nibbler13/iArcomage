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
    
    [[self.cards objectAtIndex:number] processCard];
    
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
    
    //NSLog(@"player.playedCard %d", self.playedCard);
    //NSLog(@"playerCards %@", self.cards);
    //NSLog(@"playerCardScope %@", cardsScope);
    [self.cards replaceObjectAtIndex:self.playedCard withObject:cardsScope.getRandomCard];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"player initWithCoder");
    if ((self = [super init])) {
        self.quarries = [aDecoder decodeIntegerForKey:@"playerQuarries"];
        self.magics = [aDecoder decodeIntegerForKey:@"playerMagics"];
        self.dungeons = [aDecoder decodeIntegerForKey:@"playerDungeons"];
        self.bricks = [aDecoder decodeIntegerForKey:@"playerBricks"];
        self.gems = [aDecoder decodeIntegerForKey:@"playerGems"];
        self.recruits = [aDecoder decodeIntegerForKey:@"playerRecruits"];
        self.wall = [aDecoder decodeIntegerForKey:@"playerWall"];
        self.tower = [aDecoder decodeIntegerForKey:@"playerTower"];
        self.cards = [aDecoder decodeObjectForKey:@"playerCards"];
        self.playedCard = [aDecoder decodeIntegerForKey:@"playerPlayedCard"];
        self.shouldPlayAgain = [aDecoder decodeBoolForKey:@"playerShouldPlayAgain"];
        self.shouldDiscardACard = [aDecoder decodeBoolForKey:@"playerShouldDiscardACard"];
        self.isThatPlayerTurn = [aDecoder decodeBoolForKey:@"playerIsThatPlayerTurn"];
        self.soundsOn = [aDecoder decodeBoolForKey:@"playerSoundsOn"];
        self.isCardHasBeenDiscarded = [aDecoder decodeBoolForKey:@"playerIsCardHasBeenDiscarded"];
        cardsScope = [CardsScope getCardsScope];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"player EncodeWithCoder");
    [aCoder encodeInteger:self.quarries forKey:@"playerQuarries"];
    [aCoder encodeInteger:self.magics forKey:@"playerMagics"];
    [aCoder encodeInteger:self.dungeons forKey:@"playerDungeons"];
    [aCoder encodeInteger:self.bricks forKey:@"playerBricks"];
    [aCoder encodeInteger:self.gems forKey:@"playerGems"];
    [aCoder encodeInteger:self.recruits forKey:@"playerRecruits"];
    [aCoder encodeInteger:self.wall forKey:@"playerWall"];
    [aCoder encodeInteger:self.tower forKey:@"playerTower"];
    [aCoder encodeObject:self.cards forKey:@"playerCards"];
    [aCoder encodeInteger:self.playedCard forKey:@"playerPlayedCard"];
    [aCoder encodeBool:self.shouldPlayAgain forKey:@"playerShouldPlayAgain"];
    [aCoder encodeBool:self.shouldDiscardACard forKey:@"playerShouldDiscardACard"];
    [aCoder encodeBool:self.isThatPlayerTurn forKey:@"playerIsThatPlayerTurn"];
    [aCoder encodeBool:self.soundsOn forKey:@"playerSoundsOn"];
    [aCoder encodeBool:self.isCardHasBeenDiscarded forKey:@"playerIsCardHasBeenDiscarded"];
}


@end
