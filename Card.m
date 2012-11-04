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
}

#pragma mark -Initialization

- (id)init
{
    if ([super init] != nil) {
    }
    return self;
}

#pragma mark -GamePlay

- (void)processCardForPlayer:(PlayerModel *)player andComputer:(ComputerModel *)computer
{
    if (playerModel == nil) {
        playerModel = player;
    }
    if (computerModel == nil) {
        computerModel = computer;
    }
    
    if (playerModel.isThatPlayerTurn) {
        
        player.quarries += self.quarriesSelf;
        if (player.quarries <1) {player.quarries = 1;}
        player.magics += self.magicsSelf;
        if (player.magics <1) {player.magics = 1;}
        player.dungeons += self.dungeonsSelf;
        if (player.dungeons <1) {player.dungeons = 1;}
        player.bricks += self.bricksSelf;
        if (player.bricks < 0) {player.bricks = 0;}
        player.gems += self.gemsSelf;
        if (player.gems < 0) {player.gems = 0;}
        player.recruits += self.recruitsSelf;
        if (player.recruits < 0) {player.recruits = 0;}
        player.wall += self.wallSelf;
        if (player.wall < 0) {
            player.tower += player.wall;
            player.wall = 0;}
        player.tower += self.towerSelf;
        if (player.tower < 0) {player.tower = 0;}
    
        computer.quarries += self.quarriesEnemy;
        if (computer.quarries <1) {computer.quarries = 1;}
        computer.magics += self.magicsEnemy;
        if (computer.magics <1) {computer.magics = 1;}
        computer.dungeons += self.dungeonsEnemy;
        if (computer.dungeons <1) {computer.dungeons = 1;}
        computer.bricks += self.bricksEnemy;
        if (computer.bricks < 0) {computer.bricks = 0;}
        computer.gems += self.gemsEnemy;
        if (computer.gems < 0) {computer.gems = 0;}
        computer.recruits += self.recruitsEnemy;
        if (computer.recruits < 0) {computer.recruits = 0;}
        computer.wall += self.wallEnemy;
        if (computer.wall < 0) {
            computer.tower += computer.wall;        
            computer.wall = 0;}
        computer.tower += self.towerEnemy;
        if (computer.tower < 0) {computer.tower = 0;};
        
    } else if (computerModel.isThatComputerTurn){
        
        player.quarries += self.quarriesEnemy;
        if (player.quarries <1) {player.quarries = 1;}
        player.magics += self.magicsEnemy;
        if (player.magics <1) {player.magics = 1;}
        player.dungeons += self.dungeonsEnemy;
        if (player.dungeons <1) {player.dungeons = 1;}
        player.bricks += self.bricksEnemy;
        if (player.bricks < 0) {player.bricks = 0;}
        player.gems += self.gemsEnemy;
        if (player.gems < 0) {player.gems = 0;}
        player.recruits += self.recruitsEnemy;
        if (player.recruits < 0) {player.recruits = 0;}
        player.wall += self.wallEnemy;
        if (player.wall < 0) {
            player.tower += player.wall;
            player.wall = 0;}
        player.tower += self.towerEnemy;
        if (player.tower < 0) {player.tower = 0;}
        
        computer.quarries += self.quarriesSelf;
        if (computer.quarries <1) {computer.quarries = 1;}
        computer.magics += self.magicsSelf;
        if (computer.magics <1) {computer.magics = 1;}
        computer.dungeons += self.dungeonsSelf;
        if (computer.dungeons <1) {computer.dungeons = 1;}
        computer.bricks += self.bricksSelf;
        if (computer.bricks < 0) {computer.bricks = 0;}
        computer.gems += self.gemsSelf;
        if (computer.gems < 0) {computer.gems = 0;}
        computer.recruits += self.recruitsSelf;
        if (computer.recruits < 0) {computer.recruits = 0;}
        computer.wall += self.wallSelf;
        if (computer.wall < 0) {
            computer.tower += computer.wall;
            computer.wall = 0;}
        computer.tower += self.towerSelf;
        if (computer.tower < 0) {computer.tower = 0;};
        
    } else {
        NSLog(@"ERROR!!!");
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
        ||  [self.cardName isEqualToString:@"Shadow Faerie"]) {
            player.shouldPlayAgain = YES;
        }
        
        if ([self.cardName isEqualToString:@"Prism"]
        ||  [self.cardName isEqualToString:@"Elven Scout"]) {
            player.shouldDiscardACard = YES;
        }
        
        if ([self.cardName isEqualToString:@"Prism"]
        ||  [self.cardName isEqualToString:@"Elven Scout"]) {
            player.shouldDrawACard = YES;
        }
    }
}

#pragma mark -Getters

- (NSInteger)quarriesSelf
{
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Mother Lode"]) {
            NSLog(@"Calculating Mother Lode effects");
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
            NSLog(@"Calculating Copping the Tech effects");
            if (playerModel.isThatPlayerTurn) {
                if (playerModel.quarries < computerModel.quarries) {
                    playerModel.quarries = computerModel.quarries;
                    return 0;
                }
                
            } else if (computerModel.isThatComputerTurn) {
                if (computerModel.quarries < playerModel.quarries) {
                    computerModel.quarries = playerModel.quarries;
                    return 0;
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
            NSLog(@"Calculating Parity effects");
            
            if (playerModel.magics < computerModel.magics) {
                playerModel.magics = computerModel.magics;
            } else {
                computerModel.magics = playerModel.magics;
            }
        }
    }
    return _magicsSelf;
}

- (NSInteger)magicsEnemy
{
    return _magicsEnemy;
}

- (NSInteger)dungeonsSelf
{
    if (self.additionalTerms) {
        
        if ([self.cardName isEqualToString:@"Flood Water"]) {
            NSLog(@"Calculating Flood Water effects");
            
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
            NSLog(@"Calculating Flood Water effects");
            
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
            NSLog(@"Calculating Thief effects");
            
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
            NSLog(@"Calculating Thief effects");
            
            if (playerModel.isThatPlayerTurn) {
                if (computerModel.gems < 10) {
                    return (computerModel.gems / 10);
                }
            }
            
            if (computerModel.isThatComputerTurn) {
                if (playerModel.gems < 10) {
                    return (playerModel.gems / 10);
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
        if ([self.cardName isEqualToString:@"Foundations"]) {
            NSLog(@"Calculating Foundations effects");
            
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
            NSLog(@"Calculating Shift effects");
            
                NSInteger temp = playerModel.wall;
                playerModel.wall = computerModel.wall;
                computerModel.wall = temp;
        }
        
        if ([self.cardName isEqualToString:@"Lightning Shard"]) {
            NSLog(@"Calculating Lightning Shard effects");
            
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
            NSLog(@"Calculating Spizzer effects");
            
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
            NSLog(@"Calculating Corrosion Cloud effects");
            
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
            NSLog(@"Calculating Unicorn effects");
            
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
            NSLog(@"Calculating Elven Archers effects");
            
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
            NSLog(@"Calculating Spearman effects");
            
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
            NSLog(@"Calculating Flood Water effects");
            
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
            NSLog(@"Calculating Bag of Baubles effects");
            
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
            NSLog(@"Calculating Flood Water effects");
            
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
            NSLog(@"Calculating Lightning Shard effects");
            
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
            NSLog(@"Calculating Elven Archers effects");
            
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

@end
