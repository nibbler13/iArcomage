//
//  Card.h
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayerModel.h"
#import "ComputerModel.h"

@interface Card : NSObject

@property (nonatomic) NSString *cardColor;
@property (nonatomic) NSString *cardName;
@property (nonatomic) NSString *cardDescription;
@property (nonatomic) NSInteger cardCost;
@property (nonatomic) NSInteger quarriesSelf;
@property (nonatomic) NSInteger quarriesEnemy;
@property (nonatomic) NSInteger magicsSelf;
@property (nonatomic) NSInteger magicsEnemy;
@property (nonatomic) NSInteger dungeonsSelf;
@property (nonatomic) NSInteger dungeonsEnemy;
@property (nonatomic) NSInteger bricksSelf;
@property (nonatomic) NSInteger bricksEnemy;
@property (nonatomic) NSInteger gemsSelf;
@property (nonatomic) NSInteger gemsEnemy;
@property (nonatomic) NSInteger recruitsSelf;
@property (nonatomic) NSInteger recruitsEnemy;
@property (nonatomic) NSInteger wallSelf;
@property (nonatomic) NSInteger wallEnemy;
@property (nonatomic) NSInteger towerSelf;
@property (nonatomic) NSInteger towerEnemy;
@property (nonatomic) BOOL additionalTerms;
@property (nonatomic) NSInteger cardWeight;
@property (nonatomic) BOOL isAvailable;

- (void)processCardForPlayer:(PlayerModel*)player andComputer:(ComputerModel*)computer;
- (void)increaseCardWeightOn:(NSInteger)weight;
- (void)thatCardIsAvailable:(BOOL)available;

@end
