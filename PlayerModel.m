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

@implementation PlayerModel
{
    
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
        CardsScope *newScope = [[CardsScope alloc] init];
        [self.cards  addObject:[newScope.cards objectAtIndex:0]];
        [self.cards  addObject:[newScope.cards objectAtIndex:0]];
        [self.cards  addObject:[newScope.cards objectAtIndex:0]];
        [self.cards  addObject:[newScope.cards objectAtIndex:0]];
        [self.cards  addObject:[newScope.cards objectAtIndex:0]];
    }
    return self;
}

- (void)nextTurnIncreaseResource
{
    self.bricks += self.quarries;
    self.gems += self.magics;
    self.recruits += self.dungeons;
}



@end
