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
    CardsScope *newScope;
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
        newScope = [[CardsScope alloc] init];
        [newScope loadDataFromPlist];
        self.cards = [NSMutableArray arrayWithObjects:newScope.getRandomCard, newScope.getRandomCard, newScope.getRandomCard, newScope.getRandomCard, newScope.getRandomCard, nil];
    }
    return self;
}

- (void)nextTurnIncreaseResource
{
    self.bricks += self.quarries;
    self.gems += self.magics;
    self.recruits += self.dungeons;
}

- (void)cardDiscarded:(NSInteger)number
{
    [self.cards replaceObjectAtIndex:number withObject:newScope.getRandomCard];
    [self nextTurnIncreaseResource];
}

- (void)cardSelected:(NSInteger)number
{
    [self processCard:number];
    [self.cards replaceObjectAtIndex:number withObject:newScope.getRandomCard];
    [self nextTurnIncreaseResource];
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
    self.quarries += [[self.cards objectAtIndex:number] quarriesSelf];
    if (self.quarries <1) {self.quarries = 1;}
    self.magics += [[self.cards objectAtIndex:number] magicsSelf];
    if (self.magics <1) {self.magics = 1;}
    self.dungeons += [[self.cards objectAtIndex:number] dungeonsSelf];
    if (self.dungeons <1) {self.dungeons = 1;}
    self.bricks += [[self.cards objectAtIndex:number] bricksSelf];
    self.gems += [[self.cards objectAtIndex:number] gemsSelf];
    self.recruits += [[self.cards objectAtIndex:number] recruitsSelf];
    self.wall += [[self.cards objectAtIndex:number] wallSelf];
    self.tower += [[self.cards objectAtIndex:number] towerSelf];
}



@end
