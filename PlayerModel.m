//
//  PlayerModel.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "PlayerModel.h"
#import "CardsScope.h"

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
        self.cards = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
        CardsScope *newScope = [[CardsScope alloc] init];
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
