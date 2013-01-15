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

#pragma mark -Initialization

+ (PlayerModel*)getPlayer
{
    if (player == nil) {
        player = [[PlayerModel alloc] init];
    }
    return player;
}

+ (void)destroyPlayer
{
    if (player != nil) {
        player = nil;
    }
}

- (id)init
{
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
        cardsScope = [CardsScope getCardsScope];
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
    [self.cards replaceObjectAtIndex:self.playedCard withObject:cardsScope.getRandomCard];
}


@end
