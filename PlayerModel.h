//
//  PlayerModel.h
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerModel : NSObject

@property (nonatomic) NSInteger quarries;
@property (nonatomic) NSInteger magics;
@property (nonatomic) NSInteger dungeons;
@property (nonatomic) NSInteger bricks;
@property (nonatomic) NSInteger gems;
@property (nonatomic) NSInteger recruits;
@property (nonatomic) NSInteger wall;
@property (nonatomic) NSInteger tower;
@property (nonatomic) NSMutableArray *cards;

- (void)cardSelected:(NSInteger)number;
- (void)cardDiscarded:(NSInteger)number;

@end
