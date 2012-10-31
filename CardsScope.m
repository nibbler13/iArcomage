//
//  CardsScope.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CardsScope.h"
#import "Card.h"

@implementation CardsScope

- (id)init
{
    if ([super init] != nil) {
        self.cards = [[NSMutableArray alloc] initWithCapacity:102];
        self.cards = [NSMutableArray arrayWithObjects: [[Card alloc] initWithName:@"Name"
                                                                    withColor:@"Grey"
                                                                  withDescription:@"Discription"
                                                                withCost:1
                                                                withQuarries:0
                                                                withMagic:1
                                                                withDungeon:0
                                                                withBricks:0
                                                                withGems:0
                                                                withRecruits:0
                                                                withWall:0
                                                                        withTower:1], nil];
    }
    return self;
}

@end
