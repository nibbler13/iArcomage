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
    static PlayerModel *player = nil;
    if (player == nil) {
        player = [[PlayerModel alloc] init];
    }
    return player;
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
    [self.delegate showCurrentCard:number withStatus:@"Discarded"];
    [self getNewCardAtNumber:number];
    //[self.cards replaceObjectAtIndex:number withObject:cardsScope.getRandomCard];
    [self.delegate needToUpdateCards];
    [self nextTurnIncreaseResource];
    [computer computerTurn];
}

- (void)cardSelected:(NSInteger)number
{
    [self.delegate showCurrentCard:number withStatus:@"Selected"];
    [self processCard:number];
    //[self.cards replaceObjectAtIndex:number withObject:cardsScope.getRandomCard];
    [self getNewCardAtNumber:number];
    [self.delegate needToUpdateCards];
    [self nextTurnIncreaseResource];
    [computer computerTurn];
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
    
/*     self.quarries += [[self.cards objectAtIndex:number] quarriesSelf];
     if (self.quarries <1) {self.quarries = 1;}
     self.magics += [[self.cards objectAtIndex:number] magicsSelf];
     if (self.magics <1) {self.magics = 1;}
     self.dungeons += [[self.cards objectAtIndex:number] dungeonsSelf];
     if (self.dungeons <1) {self.dungeons = 1;}
     self.bricks += [[self.cards objectAtIndex:number] bricksSelf];
     if (self.bricks < 0) {self.bricks = 0;}
     self.gems += [[self.cards objectAtIndex:number] gemsSelf];
     if (self.gems < 0) {self.gems = 0;}
     self.recruits += [[self.cards objectAtIndex:number] recruitsSelf];
     if (self.recruits < 0) {self.recruits = 0;}
     self.wall += [[self.cards objectAtIndex:number] wallSelf];
     if (self.wall < 0) {self.wall = 0;}
     self.tower += [[self.cards objectAtIndex:number] towerSelf];
     if (self.tower < 0) {self.tower = 0;}
     
     computer.quarries += [[self.cards objectAtIndex:number] quarriesEnemy];
     if (computer.quarries <1) {computer.quarries = 1;}
     computer.magics += [[self.cards objectAtIndex:number] magicsEnemy];
     if (computer.magics <1) {computer.magics = 1;}
     computer.dungeons += [[self.cards objectAtIndex:number] dungeonsEnemy];
     if (computer.dungeons <1) {computer.dungeons = 1;}
     computer.bricks += [[self.cards objectAtIndex:number] bricksEnemy];
     if (computer.bricks < 0) {computer.bricks = 0;}
     computer.gems += [[self.cards objectAtIndex:number] gemsEnemy];
     if (computer.gems < 0) {computer.gems = 0;}
     computer.recruits += [[self.cards objectAtIndex:number] recruitsEnemy];
     if (computer.recruits < 0) {computer.recruits = 0;}
     computer.wall += [[self.cards objectAtIndex:number] wallEnemy];
     if (computer.wall < 0) {computer.wall = 0;}
     computer.tower += [[self.cards objectAtIndex:number] towerEnemy];
     if (computer.tower < 0) {computer.tower = 0;};*/

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
