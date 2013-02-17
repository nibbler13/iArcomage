//
//  ScoreSystem.h
//  iArcomage
//
//  Created by NIBBLER on 2/17/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreSystem : NSObject

@property (nonatomic) NSInteger winnedByConstruction;
@property (nonatomic) NSInteger winnedByCollection;
@property (nonatomic) NSInteger winnedByDestruction;
@property (nonatomic) NSInteger lossesGames;

- (void)saveScore;

@end
