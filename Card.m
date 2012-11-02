//
//  Card.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "Card.h"

@implementation Card

#pragma mark -Initialization

- (id)init
{
    if ([super init] != nil) {
        //NSLog(@"The card init complete");
    }
    return self;
}

#pragma mark -GamePlay

- (void)processCardForPlayer:(PlayerModel *)player andComputer:(ComputerModel *)computer
{
    player.quarries += self.quarriesSelf;
    if (player.quarries <1) {player.quarries = 1;}
    player.magics += self.magicsSelf;
    if (player.magics <1) {player.magics = 1;}
    player.dungeons += self.dungeonsSelf;
    if (player.dungeons <1) {player.dungeons = 1;}
    player.bricks += self.bricksSelf;
    if (player.bricks < 0) {player.bricks = 0;}
    player.gems += self.gemsSelf;
    if (player.gems < 0) {player.gems = 0;}
    player.recruits += self.recruitsSelf;
    if (player.recruits < 0) {player.recruits = 0;}
    player.wall += self.wallSelf;
    if (player.wall < 0) {
        player.tower += player.wall;
        player.wall = 0;}
    player.tower += self.towerSelf;
    if (player.tower < 0) {player.tower = 0;}
    
    computer.quarries += self.quarriesEnemy;
    if (computer.quarries <1) {computer.quarries = 1;}
    computer.magics += self.magicsEnemy;
    if (computer.magics <1) {computer.magics = 1;}
    computer.dungeons += self.dungeonsEnemy;
    if (computer.dungeons <1) {computer.dungeons = 1;}
    computer.bricks += self.bricksEnemy;
    if (computer.bricks < 0) {computer.bricks = 0;}
    computer.gems += self.gemsEnemy;
    if (computer.gems < 0) {computer.gems = 0;}
    computer.recruits += self.recruitsEnemy;
    if (computer.recruits < 0) {computer.recruits = 0;}
    computer.wall += self.wallEnemy;
    if (computer.wall < 0) {
        computer.tower += computer.wall;        
        computer.wall = 0;}
    computer.tower += self.towerEnemy;
    if (computer.tower < 0) {computer.tower = 0;};
}

#pragma mark -Getters

- (NSInteger)quarriesSelf
{
    return _quarriesSelf;
}

- (NSInteger)quarriesEnemy
{
    return _quarriesEnemy;
}

- (NSInteger)magicsSelf
{
    return _magicsSelf;
}

- (NSInteger)magicsEnemy
{
    return _magicsEnemy;
}

- (NSInteger)dungeonsSelf
{
    return _dungeonsSelf;
}

- (NSInteger)dungeonsEnemy
{
    return _dungeonsEnemy;
}

- (NSInteger)bricksSelf
{
    return _bricksSelf;
}

- (NSInteger)bricksEnemy
{
    return _bricksEnemy;
}

- (NSInteger)gemsSelf
{
    return _gemsSelf;
}

- (NSInteger)gemsEnemy
{
    return _gemsEnemy;
}

- (NSInteger)recruitsSelf
{
    return _recruitsSelf;
}

- (NSInteger)recruitsEnemy
{
    return  _recruitsEnemy;
}

- (NSInteger)wallSelf
{
    return _wallSelf;
}

- (NSInteger)wallEnemy
{
    return _wallEnemy;
}

- (NSInteger)towerSelf
{
    return _towerSelf;
}

- (NSInteger)towerEnemy
{
    return _towerEnemy;
}

@end
