//
//  PlayerModel.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "PlayerModel.h"
#import "CardsScope.h"
#import "Card.h"
#import "ComputerModel.h"

static PlayerModel *player;

@implementation PlayerModel
{
    CardsScope *cardsScope;
    ComputerModel *computer;
}

#pragma mark -Initialization

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
        self.cards = [[NSMutableArray alloc] initWithCapacity:5];
        cardsScope = [CardsScope getCardsScope];
        [cardsScope loadDataFromPlist];
        self.cards = [NSMutableArray arrayWithObjects:cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, nil];
        computer = [ComputerModel getComputer];
    }
    return self;
}

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

#pragma mark -GamePlay

- (void)nextTurnIncreaseResource
{
    self.bricks += self.quarries;
    self.gems += self.magics;
    self.recruits += self.dungeons;
    [self.delegate needToUpdateLabelAndButton];
}

- (void)cardDiscarded:(NSInteger)number
{
    NSLog(@"PlayerTurn");
    [self.delegate showCurrentCard:number withStatus:@"Discarded"];
    if (self.shouldDiscardACard == YES) {
        NSLog(@"i'm just discard a card");
        self.shouldDiscardACard = NO;
        self.shouldPlayAgain = NO;
        [self getNewCardAtNumber:number];
        [self.delegate needToUpdateCards];
        [self.delegate restoreUseButtons];
        [self nextTurnIncreaseResource];
        return;
    }
    [self getNewCardAtNumber:number];
    [self.delegate needToUpdateCards];
    [self nextTurnIncreaseResource];
    self.isThatPlayerTurn = NO;
    [computer computerTurn];
}

- (void)cardSelected:(NSInteger)number
{
    self.isThatPlayerTurn = YES;
    NSLog(@"PlayerTurn");
    [self.delegate showCurrentCard:number withStatus:@"Selected"];
    [self processCard:number];
    if (self.shouldDrawACard == YES) {
        self.shouldDrawACard = NO;
        NSLog(@"I'm draw a new card");
    }
    [self getNewCardAtNumber:number];
    [self.delegate needToUpdateCards];
    
    if (self.shouldDiscardACard == YES) {
        [self.delegate shouldDiscardACard];
        return;
    }
    
    [self nextTurnIncreaseResource];
    if (self.shouldPlayAgain == YES) {
        self.shouldPlayAgain = NO;
        NSLog(@"I'm in shouldPlayAgain");
    } else {
        NSLog(@"I'm in one step from computerTurn");
        self.isThatPlayerTurn = NO;
        [computer computerTurn];
    }
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

- (void)processCard:(NSInteger)number
{
    [self payForTheCard:number];
    [[self.cards objectAtIndex:number] processCardForPlayer:self andComputer:computer];
    [self.delegate needToCheckThatTheVictoryConditionsIsAchieved];

}

- (void)getNewCardAtNumber:(NSInteger)number
{
    Card *tempCard;
    for (int i = number; i <= 4; i++) {
        if (i != 4) {
            tempCard = [self.cards objectAtIndex:i + 1];
            [self.cards replaceObjectAtIndex:i withObject:tempCard];
        } else {
        [self.cards replaceObjectAtIndex:4 withObject:cardsScope.getRandomCard];
        }
    }
}

@end
