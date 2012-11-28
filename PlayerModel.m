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
    NSInteger playedCard;
}

#pragma mark -Initialization

+ (PlayerModel*)getPlayer
{
    NSLog(@"get player");
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
    NSLog(@"init player");
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
        self.shouldDrawACard = NO;
        self.shouldDiscardACard = NO;
        self.shouldPlayAgain = NO;
        self.cards = [[NSMutableArray alloc] initWithCapacity:6];
        self.soundsOn = YES;
        cardsScope = [CardsScope getCardsScope];
        cardsScope.soundsOn = self.soundsOn;
        self.cards = [NSMutableArray arrayWithObjects:cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, nil];
        computer = [ComputerModel getComputer];
        NSLog(@"complete init player");
    }
    return self;
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
    if (self.soundsOn) {
        [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
    }
    [self.delegate showCurrentCard:number withStatus:@"Discarded"];
    if (self.shouldDiscardACard == YES) {
        NSLog(@"i'm just discard a card");
        self.shouldDiscardACard = NO;
        self.shouldPlayAgain = NO;
        //[self getNewCardAtNumber:number];
        playedCard = number;
        [self.delegate playerShouldDiscardACard];
        [self.delegate needToUpdateCards];
        [self.delegate restoreUseButtons];
        //=================================NEED TO CHECK THIS================
        [self nextTurnIncreaseResource];
        return;
    }
    playedCard = number;
    //[self getNewCardAtNumber:number];
    [self.delegate needToUpdateCards];
    //=================================NEED TO CHECK THIS================
    [self nextTurnIncreaseResource];
    self.isThatPlayerTurn = NO;
    [computer computerTurn];
}

- (void)cardSelected:(NSInteger)number
{
    self.isThatPlayerTurn = YES;
    NSLog(@"PlayerTurn");
    [self.delegate showCurrentCard:number withStatus:@"Selected"];
    if (self.soundsOn) {
        [cardsScope playDealSoundEffectForEvent:@"WillTakeACard"];
    }
    [self processCard:number];
    if (self.shouldDrawACard == YES) {
        self.shouldDrawACard = NO;
        NSLog(@"I'm draw a new card");
    }
    playedCard = number;
    //[self getNewCardAtNumber:number];
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
    if (self.soundsOn) {
        if ([[self.cards objectAtIndex:number] quarriesSelf] > 0 ||
            [[self.cards objectAtIndex:number] magicsSelf] > 0 ||
            [[self.cards objectAtIndex:number] dungeonsSelf] > 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfGeneralResource"];
        }
        if ([[self.cards objectAtIndex:number] quarriesSelf] < 0 ||
            [[self.cards objectAtIndex:number] magicsSelf] < 0 ||
            [[self.cards objectAtIndex:number] dungeonsSelf] < 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfGeneralResource"];
        }
        if ([[self.cards objectAtIndex:number] bricksSelf] > 0 ||
            [[self.cards objectAtIndex:number] gemsSelf] > 0 ||
            [[self.cards objectAtIndex:number] recruitsSelf] > 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillIncreaseSelfCommonResource"];
        }
        if ([[self.cards objectAtIndex:number] bricksSelf] < 0 ||
            [[self.cards objectAtIndex:number] gemsSelf] < 0 ||
            [[self.cards objectAtIndex:number] recruitsSelf] < 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillDecreaseSelfCommonResource"];
        }
        if ([[self.cards objectAtIndex:number] towerSelf] > 0 ||
            [[self.cards objectAtIndex:number] wallSelf] > 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillIncreaseTowerOrWall"];
        }
        if ([[self.cards objectAtIndex:number] towerSelf] < 0 ||
            [[self.cards objectAtIndex:number] wallSelf] < 0) {
            [cardsScope playDealSoundEffectForEvent:@"WillTakeDamage"];
        }
    }
    [[self.cards objectAtIndex:number] processCardForPlayer:self andComputer:computer];
    [self.delegate needToCheckThatTheVictoryConditionsIsAchieved];

}

- (void)getNewCardAtNumber
{
    Card *tempCard;
    for (int i = playedCard; i < [self.cards count]; i++) {
        if (i != ([self.cards count] -1)) {
            tempCard = [self.cards objectAtIndex:i + 1];
            [self.cards replaceObjectAtIndex:i withObject:tempCard];
        } else {
        [self.cards replaceObjectAtIndex:([self.cards count] - 1) withObject:cardsScope.getRandomCard];
        }
    }
    //[[self.cards objectAtIndex:playedCard] setCenterOfImageWithPoint:(CGPointMake(playedCard*80, 240))];
}


@end
