//
//  ComputerModel.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "ComputerModel.h"
#import "CardsScope.h"
#import "Card.h"

@implementation ComputerModel
{
    CardsScope *cardsScope;
}

#pragma mark -Initialization

+ (ComputerModel*)getComputer
{
    static ComputerModel *computer = nil;
    if (computer == nil) {
        computer = [[ComputerModel alloc] init];
    }
    return computer;
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
        self.cards = [[NSMutableArray alloc] initWithCapacity:5];
        cardsScope = [CardsScope getCardsScope];
        [cardsScope loadDataFromPlist];
        self.cards = [NSMutableArray arrayWithObjects:cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, cardsScope.getRandomCard, nil];
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

- (void)computerTurn
{
    [self nextTurnIncreaseResource];
}


@end
