//
//  Card.h
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic) NSString *cardColor;
@property (nonatomic) NSString *cardName;
@property (nonatomic) NSString *cardDescription;
@property (nonatomic) NSString *cardCost;
@property (nonatomic) NSInteger quarriesEffect;
@property (nonatomic) NSInteger magicEffect;
@property (nonatomic) NSInteger dungeonsEffect;
@property (nonatomic) NSInteger bricksEffect;
@property (nonatomic) NSInteger gemsEffect;
@property (nonatomic) NSInteger recruitsEffect;
@property (nonatomic) NSInteger wallEffect;
@property (nonatomic) NSInteger towerEffect;
@property (nonatomic) BOOL hasAdditionalTerms;

@end
