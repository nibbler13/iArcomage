//
//  Card.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)init
{
    if ([super init] != nil) {
        self.quarriesEffect = 0;
        self.magicEffect = 0;
        self.dungeonsEffect = 0;
        self.bricksEffect = 0;
        self.gemsEffect = 0;
        self.recruitsEffect = 0;
        self.wallEffect = 0;
        self.towerEffect = 0;
    }
    return self;
}

@end
