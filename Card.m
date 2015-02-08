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
    if (self = [super init]) {
        playerWall = 0;
        computerWall = 0;
    }
    return self;
}

#pragma mark -GamePlay

- (void)initPlayerModel:(PlayerModel*)player andComputerModel:(ComputerModel*)computer
{
    if (playerModel == nil) {
        playerModel = player;
    }
    if (computerModel == nil) {
        computerModel = computer;
    }
}

- (void)processCard
{
    playerWall = playerModel.wall;
    computerWall = computerModel.wall;
    
    if (playerModel.isThatPlayerTurn & computerModel.isThatComputerTurn){
        NSLog(@"=============Both isThatTurn are positive=============");
    }
    
    if (!playerModel.isThatPlayerTurn & !computerModel.isThatComputerTurn) {
        NSLog(@"=============Both isThatTurn are negative=============");
    }
    
    NSLog(@"---------------------");
    
    if (self.quarriesSelf != 0) {
        NSLog(@"quarriesSelf = %ld", (long)self.quarriesSelf);
    }
    if (self.quarriesEnemy != 0) {
        NSLog(@"quarriesEnemy = %ld", (long)self.quarriesEnemy);
    }
    if (self.magicsSelf != 0) {
        NSLog(@"magicsSelf = %ld", (long)self.magicsSelf);
    }
    if (self.magicsEnemy != 0) {
        NSLog(@"magicsEnemy = %ld", (long)self.magicsEnemy);
    }
    if (self.dungeonsSelf != 0) {
        NSLog(@"dungeonsSelf = %ld", (long)self.dungeonsSelf);
    }
    if (self.dungeonsEnemy != 0) {
        NSLog(@"dungeonsEnemy = %ld", (long)self.dungeonsEnemy);
    }
    if (self.bricksSelf != 0) {
        NSLog(@"bricksSelf = %ld", (long)self.bricksSelf);
    }
    if (self.bricksEnemy != 0) {
        NSLog(@"bricksEnemy = %ld", (long)self.bricksEnemy);
    }
    if (self.gemsSelf != 0) {
        NSLog(@"gemsSelf = %ld", (long)self.gemsSelf);
    }
    if (self.gemsEnemy != 0) {
        NSLog(@"gemsEnemy = %ld", (long)self.gemsEnemy);
    }
    if (self.recruitsSelf != 0) {
        NSLog(@"recruitsSelf = %ld", (long)self.recruitsSelf);
    }
    if (self.recruitsEnemy != 0) {
        NSLog(@"recruitsEnemy = %ld", (long)self.recruitsEnemy);
    }
    if (self.wallSelf != 0) {
        NSLog(@"wallSelf = %ld", (long)self.wallSelf);
    }
    if (self.wallEnemy != 0) {
        NSLog(@"wallEnemy = %ld", (long)self.wallEnemy);
    }
    if (self.towerSelf != 0) {
        NSLog(@"towerSelf = %ld", (long)self.towerSelf);
    }
    if (self.towerEnemy != 0) {
        NSLog(@"towerEnemy = %ld", (long)self.towerEnemy);
    }
    NSLog(@"card cost: %ld", (long)self.cardCost);
    
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
                NSLog(@"playerModel shouldPlayAgain");
            } else if (computerModel.isThatComputerTurn) {
                computerModel.shouldPlayAgain = YES;
                NSLog(@"computerModel shouldPlayAgain");
            }
        }
        
        if ([self.cardName isEqualToString:@"Prism"]
        ||  [self.cardName isEqualToString:@"Elven Scout"]) {
            if (playerModel.isThatPlayerTurn) {
                playerModel.shouldDiscardACard = YES;
                NSLog(@"playerModel shouldDiscardACard");
            } else if (computerModel.isThatComputerTurn) {
                computerModel.shouldDiscardACard = YES;
                NSLog(@"computerModel shouldDiscardACard");
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
                if (computerModel.dungeons < playerModel.dungeons) {
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
            }
            
            if (computerModel.isThatComputerTurn) {
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
            }
            
            if (computerModel.isThatComputerTurn) {
                return computerWall - playerWall;
            }
        }
        
        if ([self.cardName isEqualToString:@"Lightning Shard"]) {
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.tower < computerModel.wall) {
                    return -8;
                }
            }
            if (computerModel.isThatComputerTurn) {
                if (computerModel.tower < playerModel.wall) {
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
            }
            
            if (computerModel.isThatComputerTurn) {
                if (playerModel.wall > 0) {
                    return -10;
                } else {
                    return -7;
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
                if (playerModel.tower > computerModel.wall) {
                    return -8;
                }
            }
            if (computerModel.isThatComputerTurn) {
                if (computerModel.tower > playerModel.wall) {
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

@end
