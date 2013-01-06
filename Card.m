//
//  Card.m
//  iArcomage
//
//  Created by NIBBLER on 31.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "Card.h"

@implementation Card
{
    PlayerModel *playerModel;
    ComputerModel *computerModel;
    
    NSInteger playerWall;
    NSInteger computerWall;
}

#pragma mark -Initialization

- (id)init
{
    //NSLog(@"card init");
    if ([super init] != nil) {
        playerWall = 0;
        computerWall = 0;
    }
    return self;
}

- (void)dealloc
{
    //NSLog(@"card Dealloc");
}

#pragma mark -GamePlay

- (void)initPlayerModel:(PlayerModel*)player andComputerModel:(ComputerModel*)computer
{
    if (playerModel == nil) {
        //NSLog(@"card - init player");
        playerModel = player;
    }
    if (computerModel == nil) {
        //NSLog(@"card - init computer");
        computerModel = computer;
    }
}

- (void)processCard
{
    playerWall = playerModel.wall;
    computerWall = computerModel.wall;
    //NSLog(@"------------------------------------");
    //NSLog(@"isThisPlayer: %d, isThisComputer: %d", playerModel.isThatPlayerTurn, computerModel.isThatComputerTurn);
    //NSLog(@"%@, %d", self.cardName, self.cardCost);
    //NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d", self.quarriesSelf, self.quarriesEnemy, self.magicsSelf, self.magicsEnemy, self.dungeonsSelf, self.dungeonsEnemy, self.bricksSelf, self.bricksEnemy, self.gemsSelf, self.gemsEnemy, self.recruitsSelf, self.recruitsEnemy, self.towerSelf, self.towerEnemy, self.wallSelf, self.wallEnemy);
    
    if (playerModel.isThatPlayerTurn & computerModel.isThatComputerTurn){
        NSLog(@"=============Both isThatTurn are positive=============");
    }
    
    if (!playerModel.isThatPlayerTurn & !computerModel.isThatComputerTurn) {
        NSLog(@"=============Both isThatTurn are negative=============");
    }
    
    if (playerModel.isThatPlayerTurn) {
        
        playerModel.quarries += self.quarriesSelf;
        if (playerModel.quarries <1) {playerModel.quarries = 1;}
        playerModel.magics += self.magicsSelf;
        if (playerModel.magics <1) {playerModel.magics = 1;}
        playerModel.dungeons += self.dungeonsSelf;
        if (playerModel.dungeons <1) {playerModel.dungeons = 1;}
        playerModel.bricks += self.bricksSelf;
        if (playerModel.bricks < 0) {playerModel.bricks = 0;}
        playerModel.gems += self.gemsSelf;
        if (playerModel.gems < 0) {playerModel.gems = 0;}
        playerModel.recruits += self.recruitsSelf;
        if (playerModel.recruits < 0) {playerModel.recruits = 0;}
        playerModel.wall += self.wallSelf;
        if (playerModel.wall < 0) {
            playerModel.tower += playerModel.wall;
            playerModel.wall = 0;}
        playerModel.tower += self.towerSelf;
        if (playerModel.tower < 0) {playerModel.tower = 0;}
    
        computerModel.quarries += self.quarriesEnemy;
        if (computerModel.quarries <1) {computerModel.quarries = 1;}
        computerModel.magics += self.magicsEnemy;
        if (computerModel.magics <1) {computerModel.magics = 1;}
        computerModel.dungeons += self.dungeonsEnemy;
        if (computerModel.dungeons <1) {computerModel.dungeons = 1;}
        computerModel.bricks += self.bricksEnemy;
        if (computerModel.bricks < 0) {computerModel.bricks = 0;}
        computerModel.gems += self.gemsEnemy;
        if (computerModel.gems < 0) {computerModel.gems = 0;}
        computerModel.recruits += self.recruitsEnemy;
        if (computerModel.recruits < 0) {computerModel.recruits = 0;}
        computerModel.wall += self.wallEnemy;
        if (computerModel.wall < 0) {
            computerModel.tower += computerModel.wall;        
            computerModel.wall = 0;}
        computerModel.tower += self.towerEnemy;
        if (computerModel.tower < 0) {computerModel.tower = 0;};
        
    } else if (computerModel.isThatComputerTurn){
        
        playerModel.quarries += self.quarriesEnemy;
        if (playerModel.quarries <1) {playerModel.quarries = 1;}
        playerModel.magics += self.magicsEnemy;
        if (playerModel.magics <1) {playerModel.magics = 1;}
        playerModel.dungeons += self.dungeonsEnemy;
        if (playerModel.dungeons <1) {playerModel.dungeons = 1;}
        playerModel.bricks += self.bricksEnemy;
        if (playerModel.bricks < 0) {playerModel.bricks = 0;}
        playerModel.gems += self.gemsEnemy;
        if (playerModel.gems < 0) {playerModel.gems = 0;}
        playerModel.recruits += self.recruitsEnemy;
        if (playerModel.recruits < 0) {playerModel.recruits = 0;}
        playerModel.wall += self.wallEnemy;
        if (playerModel.wall < 0) {
            playerModel.tower += playerModel.wall;
            playerModel.wall = 0;}
        playerModel.tower += self.towerEnemy;
        if (playerModel.tower < 0) {playerModel.tower = 0;}
        
        computerModel.quarries += self.quarriesSelf;
        if (computerModel.quarries <1) {computerModel.quarries = 1;}
        computerModel.magics += self.magicsSelf;
        if (computerModel.magics <1) {computerModel.magics = 1;}
        computerModel.dungeons += self.dungeonsSelf;
        if (computerModel.dungeons <1) {computerModel.dungeons = 1;}
        computerModel.bricks += self.bricksSelf;
        if (computerModel.bricks < 0) {computerModel.bricks = 0;}
        computerModel.gems += self.gemsSelf;
        if (computerModel.gems < 0) {computerModel.gems = 0;}
        computerModel.recruits += self.recruitsSelf;
        if (computerModel.recruits < 0) {computerModel.recruits = 0;}
        computerModel.wall += self.wallSelf;
        if (computerModel.wall < 0) {
            computerModel.tower += computerModel.wall;
            computerModel.wall = 0;}
        computerModel.tower += self.towerSelf;
        if (computerModel.tower < 0) {computerModel.tower = 0;};
        
    } else {
        NSLog(@"PROCESS CARD ERROR!!!");
    }
    
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Lucky Cache"]
        ||  [self.cardName isEqualToString:@"Friendly Terrain"]
        ||  [self.cardName isEqualToString:@"Tremors"]
        ||  [self.cardName isEqualToString:@"Secret Room"]
        ||  [self.cardName isEqualToString:@"Quartz"]
        ||  [self.cardName isEqualToString:@"Prism"]
        ||  [self.cardName isEqualToString:@"Faerie"]
        ||  [self.cardName isEqualToString:@"Elven Scout"]
        ||  [self.cardName isEqualToString:@"Shadow Faerie"]
        ||  [self.cardName isEqualToString:@"Smoky Quartz"]) {
            if (playerModel.isThatPlayerTurn) {
                playerModel.shouldPlayAgain = YES;
            } else if (computerModel.isThatComputerTurn) {
                computerModel.shouldPlayAgain = YES;
            }
        }
        
        if ([self.cardName isEqualToString:@"Prism"]
        ||  [self.cardName isEqualToString:@"Elven Scout"]) {
            if (playerModel.isThatPlayerTurn) {
                playerModel.shouldDiscardACard = YES;
            } else if (computerModel.isThatComputerTurn) {
                computerModel.shouldDiscardACard = YES;
            }
        }
    }
}

#pragma mark -Getters

- (NSInteger)quarriesSelf
{
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Mother Lode"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.quarries < computerModel.quarries) {
                    return 2;
                } else {
                    return 1;
                }
            } else if (computerModel.isThatComputerTurn) {
                if (computerModel.quarries < playerModel.quarries) {
                    return 2;
                } else {
                    return 1;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Copping the Tech"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.quarries < computerModel.quarries) {
                    return computerModel.quarries - playerModel.quarries;
                }
                
            } else if (computerModel.isThatComputerTurn) {
                if (computerModel.quarries < playerModel.quarries) {
                    return playerModel.quarries - computerModel.quarries;
                }
            }
        }
        
    }
    return _quarriesSelf;
}

- (NSInteger)quarriesEnemy
{
    return _quarriesEnemy;
}

- (NSInteger)magicsSelf
{
    if (self.additionalTerms) {
        if ([self.cardName isEqualToString:@"Parity"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.magics < computerModel.magics) {
                    return computerModel.magics - playerModel.magics;
                }
            } else if (computerModel.isThatComputerTurn) {
                if (computerModel.magics < playerModel.magics) {
                    return playerModel.magics - computerModel.magics;
                }
            }
        }
    }
    return _magicsSelf;
}

- (NSInteger)magicsEnemy
{
    if (self.additionalTerms) {
        if ([self.cardName isEqualToString:@"Parity"]) {
            if (playerModel.isThatPlayerTurn) {
                if (computerModel.magics < playerModel.magics) {
                    return playerModel.magics - computerModel.magics;
                }
            } else if (computerModel.isThatComputerTurn) {
                if (playerModel.magics < computerModel.magics) {
                    return computerModel.magics - playerModel.magics;
                }
            }
        }
    }
    return _magicsEnemy;
}

- (NSInteger)dungeonsSelf
{
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Flood Water"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall < computerModel.wall) {
                    return -1;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall < playerModel.wall) {
                    return -1;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Barracks"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.dungeons < computerModel.dungeons) {
                    return 1;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.dungeons < computerModel.dungeons) {
                    return 1;
                }
            }
        }

    }
    return _dungeonsSelf;
}

- (NSInteger)dungeonsEnemy
{
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Flood Water"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall > computerModel.wall) {
                    return -1;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall > playerModel.wall) {
                    return -1;
                }
            }
        }
        
    }
    return _dungeonsEnemy;
}

- (NSInteger)bricksSelf
{
    if (self.additionalTerms) {
        if ([self.cardName isEqualToString:@"Thief"]) {
            if (playerModel.isThatPlayerTurn) {
                if (computerModel.bricks < 5) {
                    return (computerModel.bricks / 2);
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (playerModel.bricks < 5) {
                    return  (playerModel.bricks / 2);
                }
            }
        }
    }
    return _bricksSelf;
}

- (NSInteger)bricksEnemy
{
    return _bricksEnemy;
}

- (NSInteger)gemsSelf
{
    if (self.additionalTerms) {
        if ([self.cardName isEqualToString:@"Thief"]) {
            if (playerModel.isThatPlayerTurn) {
                if (computerModel.gems < 10) {
                    return (computerModel.gems / 2);
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (playerModel.gems < 10) {
                    return (playerModel.gems / 2);
                }
            }
        }
    }
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
    if (self.additionalTerms) {
        if ([self.cardName isEqualToString:@"Shift"]) {
            if (playerModel.isThatPlayerTurn) {
                return computerWall - playerWall;
            } else if (computerModel.isThatComputerTurn) {
                return playerWall - computerWall;
            }
        }

        if ([self.cardName isEqualToString:@"Foundations"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall == 0) {
                    return 5;
                } else {
                    return 3;
                }
            }
        
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall == 0) {
                    return 5;
                } else {
                    return 3;
                }
            }
        }
    }
    return _wallSelf;
}

- (NSInteger)wallEnemy
{
    if (self.additionalTerms) {
        if ([self.cardName isEqualToString:@"Shift"]) {
            if (playerModel.isThatPlayerTurn) {
                return playerWall - computerWall;
            } else if (computerModel.isThatComputerTurn) {
                return computerWall - playerWall;
            }
        }
        
        if ([self.cardName isEqualToString:@"Lightning Shard"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.tower < computerModel.tower) {
                    return -8;
                }
            }
            if (computerModel.isThatComputerTurn) {
                if (computerModel.tower < playerModel.tower) {
                    return -8;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Spizzer"]) {
            if (playerModel.isThatPlayerTurn) {
                if (computerModel.wall == 0) {
                    return -10;
                } else {
                    return -6;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (playerModel.wall == 0) {
                    return -10;
                } else {
                    return -6;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Corrosion Cloud"]) {
            if (playerModel.isThatPlayerTurn) {
                if (computerModel.wall > 0) {
                    return -10;
                } else {
                    return -7;
                }
                
                if (computerModel.isThatComputerTurn) {
                    if (playerModel.wall > 0) {
                        return -10;
                    } else {
                        return -7;
                    }
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Unicorn"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.magics > computerModel.magics) {
                    return -12;
                } else {
                    return  -8;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.magics > playerModel.magics) {
                    return -12;
                } else {
                    return -8;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Elven Archers"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall < computerModel.wall) {
                    return -6;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall < playerModel.wall) {
                    return -6;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Spearman"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall > computerModel.wall) {
                    return -3;
                } else {
                    return -2;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall > playerModel.wall) {
                    return -3;
                } else {
                    return -2;
                }
            }
        }
    }
    return _wallEnemy;
}

- (NSInteger)towerSelf
{
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Flood Water"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall < computerModel.wall) {
                    return -2;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall < playerModel.wall) {
                    return -2;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Bag of Baubles"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.tower < computerModel.tower) {
                    return 2;
                } else {
                    return 1;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.tower < playerModel. tower) {
                    return 2;
                } else {
                    return 1;
                }
            }
        }
    }
    return _towerSelf;
}

- (NSInteger)towerEnemy
{
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Flood Water"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall > computerModel.wall) {
                    return -2;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall > playerModel.wall) {
                    return -2;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Lightning Shard"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.tower > computerModel.tower) {
                    return -8;
                }
            }
            if (computerModel.isThatComputerTurn) {
                if (computerModel.tower > playerModel.tower) {
                    return -8;
                }
            }
        }
        
        if ([self.cardName isEqualToString:@"Elven Archers"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.wall > computerModel.wall) {
                    return -6;
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (computerModel.wall > playerModel.wall) {
                    return -6;
                }
            }
        }
    }
    return _towerEnemy;
}

- (void)increaseCardWeightOn:(NSInteger)weight
{
    self.cardWeight += weight;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    NSLog(@"card EncodeWithCoder");
    [aCoder encodeObject:self.cardColor forKey:@"cardColor"];
    [aCoder encodeObject:self.cardName forKey:@"cardName"];
    [aCoder encodeObject:self.cardDescription forKey:@"cardDescription"];
    [aCoder encodeInteger:self.cardCost forKey:@"cardCost"];
    [aCoder encodeInteger:self.quarriesSelf forKey:@"quarriesSelf"];
    [aCoder encodeInteger:self.quarriesEnemy forKey:@"quarriesEnemy"];
    [aCoder encodeInteger:self.magicsSelf forKey:@"magicsSelf"];
    [aCoder encodeInteger:self.magicsEnemy forKey:@"magicsEnemy"];
    [aCoder encodeInteger:self.dungeonsSelf forKey:@"dungeonsSelf"];
    [aCoder encodeInteger:self.dungeonsEnemy forKey:@"dungeonsEnemy"];
    [aCoder encodeInteger:self.bricksSelf forKey:@"bricksSelf"];
    [aCoder encodeInteger:self.bricksEnemy forKey:@"bricksEnemy"];
    [aCoder encodeInteger:self.gemsSelf forKey:@"gemsSelf"];
    [aCoder encodeInteger:self.gemsEnemy forKey:@"gemsEnemy"];
    [aCoder encodeInteger:self.recruitsSelf forKey:@"recruitsSelf"];
    [aCoder encodeInteger:self.recruitsEnemy forKey:@"recruitsEnemy"];
    [aCoder encodeInteger:self.wallSelf forKey:@"wallSelf"];
    [aCoder encodeInteger:self.wallEnemy forKey:@"wallEnemy"];
    [aCoder encodeInteger:self.towerSelf forKey:@"towerSelf"];
    [aCoder encodeInteger:self.towerEnemy forKey:@"towerEnemy"];
    [aCoder encodeBool:self.additionalTerms forKey:@"additionalTerms"];
    [aCoder encodeInteger:self.cardWeight forKey:@"cardWeight"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"card initWithCoder");
    if (self = [super init]) {
        self.cardColor = [aDecoder decodeObjectForKey:@"cardColor"];
        self.cardName = [aDecoder decodeObjectForKey:@"cardName"];
        self.cardDescription = [aDecoder decodeObjectForKey:@"cardDescription"];
        self.cardCost = [aDecoder decodeIntegerForKey:@"cardCost"];
        self.quarriesSelf = [aDecoder decodeIntegerForKey:@"quarriesSelf"];
        self.quarriesEnemy = [aDecoder decodeIntegerForKey:@"quarriesEnemy"];
        self.magicsSelf = [aDecoder decodeIntegerForKey:@"magicsSelf"];
        self.magicsEnemy = [aDecoder decodeIntegerForKey:@"magicsEnemy"];
        self.dungeonsSelf = [aDecoder decodeIntegerForKey:@"dungeonsSelf"];
        self.dungeonsEnemy = [aDecoder decodeIntegerForKey:@"dungeonsEnemy"];
        self.bricksSelf = [aDecoder decodeIntegerForKey:@"bricksSelf"];
        self.bricksEnemy = [aDecoder decodeIntegerForKey:@"bricksEnemy"];
        self.gemsSelf = [aDecoder decodeIntegerForKey:@"gemsSelf"];
        self.gemsEnemy = [aDecoder decodeIntegerForKey:@"gemsEnemy"];
        self.recruitsSelf = [aDecoder decodeIntegerForKey:@"recruitsSelf"];
        self.recruitsEnemy = [aDecoder decodeIntegerForKey:@"recruitsEnemy"];
        self.wallSelf = [aDecoder decodeIntegerForKey:@"wallSelf"];
        self.wallEnemy = [aDecoder decodeIntegerForKey:@"wallEnemy"];
        self.towerSelf = [aDecoder decodeIntegerForKey:@"towerSelf"];
        self.towerEnemy = [aDecoder decodeIntegerForKey:@"towerEnemy"];
        self.additionalTerms = [aDecoder decodeBoolForKey:@"additionalTerms"];
        self.cardWeight = [aDecoder decodeIntegerForKey:@"cardWeight"];
    }
    return self;
}

@end
