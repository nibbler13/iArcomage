//
//  Card.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "Card.h"
#import "PlayerModel.h"
#import "ComputerModel.h"

@implementation Card

- (id)initWithName:(NSString*)name
    withColor:(NSString*)color
    withDescription:(NSString*)description
    withCost:(NSInteger)cost
    withQuarries:(NSInteger)quarries
    withMagic:(NSInteger)magic
    withDungeon:(NSInteger)dungeon
    withBricks:(NSInteger)bricks
    withGems:(NSInteger)gems
    withRecruits:(NSInteger)rectuits
    withWall:(NSInteger)wall
    withTower:(NSInteger)tower
{
    if ([super init] != nil) {
        _cardName = name;
        _cardColor = color;
        _cardDescription = description;
        _cardCost = cost;
        _quarriesEffect = quarries;
        _magicEffect = magic;
        _dungeonsEffect = dungeon;
        _bricksEffect = bricks;
        _gemsEffect = gems;
        _recruitsEffect = rectuits;
        _wallEffect = wall;
        _towerEffect = tower;
    }
    return self;
}

- (void)prepare
{
    
}

- (NSInteger)quarriesEffect
{
    return _quarriesEffect;
}

- (NSInteger)magicEffect
{
    return _magicEffect;
}

- (NSInteger)dungeonsEffect
{
    return _dungeonsEffect;
}

- (NSInteger)bricksEffect
{
    return _bricksEffect;
}

- (NSInteger)gemsEffect
{
    return _gemsEffect;
}

- (NSInteger)recruitsEffect
{
    return _recruitsEffect;
}

- (NSInteger)wallEffect
{
    return _wallEffect;
}

- (NSInteger)towerEffect
{
    return _towerEffect;
}

@end
