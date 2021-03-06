//
//  CardsScope.h
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardsScope : NSObject

@property (nonatomic) NSMutableArray *cards;

- (Card*)getRandomCard;
- (Card*)getCardAtNumber:(NSInteger)number;

+ (CardsScope*)getCardsScope;
+ (void)destroyCardsScope;

@end
