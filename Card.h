//
//  Card.h
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@class Card;

@property (nonatomic) NSString *cardColor;
@property (nonatomic) NSString *cardName;
@property (nonatomic) NSString *cardDescription;
@property (nonatomic) NSInteger cardCost;
@property (nonatomic) NSInteger quarriesEffect;
@property (nonatomic) NSInteger magicEffect;
@property (nonatomic) NSInteger dungeonsEffect;
@property (nonatomic) NSInteger bricksEffect;
@property (nonatomic) NSInteger gemsEffect;
@property (nonatomic) NSInteger recruitsEffect;
@property (nonatomic) NSInteger wallEffect;
@property (nonatomic) NSInteger towerEffect;

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
         withTower:(NSInteger)tower;

@end
