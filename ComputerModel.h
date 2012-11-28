//
//  ComputerModel.h
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ComputerModelDelegate <NSObject>

- (void)needToUpdateLabels;
- (void)needToCheckThatTheVictoryConditionsIsAchievedByComputer;
- (void)showCurrentComputerCard:(NSInteger)number withStatus:(NSString*)status;
//===========This methods for draw animation for computer cards=======
- (void)playerShouldTakeANewCard;
- (void)needToUpdateComputerCards;
- (void)computerHasDiscardTheCard:(NSInteger)number;
- (void)computerHasPlayTheCard:(NSInteger)number;

@end

@interface ComputerModel : NSObject

@property (nonatomic, strong) id <ComputerModelDelegate> delegate;
@property (nonatomic) NSInteger quarries;
@property (nonatomic) NSInteger magics;
@property (nonatomic) NSInteger dungeons;
@property (nonatomic) NSInteger bricks;
@property (nonatomic) NSInteger gems;
@property (nonatomic) NSInteger recruits;
@property (nonatomic) NSInteger wall;
@property (nonatomic) NSInteger tower;
@property (nonatomic) NSMutableArray *cards;
@property (nonatomic) BOOL shouldPlayAgain;
@property (nonatomic) BOOL shouldDiscardACard;
@property (nonatomic) BOOL shouldDrawACard;
@property (nonatomic) BOOL isThatComputerTurn;

- (void)computerTurn;

+ (ComputerModel*)getComputer;

+ (void)destroyComputer;

@end
