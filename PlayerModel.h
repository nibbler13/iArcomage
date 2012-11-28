//
//  PlayerModel.h
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlayerModelDelegate <NSObject>

- (void)needToUpdateLabelAndButton;
- (void)needToUpdateCards;
- (void)showCurrentCard:(NSInteger)number withStatus:(NSString*)status;
- (void)shouldDiscardACard;
- (void)restoreUseButtons;
- (void)needToCheckThatTheVictoryConditionsIsAchieved;

- (void)playerShouldDiscardACard;

@end

@interface PlayerModel : NSObject

@property (nonatomic, strong) id <PlayerModelDelegate> delegate;
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
@property (nonatomic) BOOL isThatPlayerTurn;
@property (nonatomic) BOOL soundsOn;

- (void)cardSelected:(NSInteger)number;
- (void)cardDiscarded:(NSInteger)number;

+ (PlayerModel*)getPlayer;

+ (void)destroyPlayer;

@end
