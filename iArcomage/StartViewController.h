//
//  StartViewController.h
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerModel.h"
#import "ComputerModel.h"

@interface StartViewController : UIViewController
    <
        PlayerModelDelegate,
        ComputerModelDelegate,
        UIAlertViewDelegate
    >

@property (weak, nonatomic) IBOutlet UILabel *playerQuarries;
@property (weak, nonatomic) IBOutlet UILabel *playerMagics;
@property (weak, nonatomic) IBOutlet UILabel *playerDungeons;
@property (weak, nonatomic) IBOutlet UILabel *playerBricks;
@property (weak, nonatomic) IBOutlet UILabel *playerGems;
@property (weak, nonatomic) IBOutlet UILabel *playerRecruits;
@property (weak, nonatomic) IBOutlet UILabel *playerWall;
@property (weak, nonatomic) IBOutlet UILabel *playerTower;

@property (weak, nonatomic) IBOutlet UILabel *computerQuarries;
@property (weak, nonatomic) IBOutlet UILabel *computerMagics;
@property (weak, nonatomic) IBOutlet UILabel *computerDungeons;
@property (weak, nonatomic) IBOutlet UILabel *computerBricks;
@property (weak, nonatomic) IBOutlet UILabel *computerGems;
@property (weak, nonatomic) IBOutlet UILabel *computerRecruits;
@property (weak, nonatomic) IBOutlet UILabel *computerWall;
@property (weak, nonatomic) IBOutlet UILabel *computerTower;

@property (weak, nonatomic) IBOutlet UILabel *currentCardName;
@property (weak, nonatomic) IBOutlet UILabel *currentCardDescription;
@property (weak, nonatomic) IBOutlet UILabel *currentCardCost;

@property (weak, nonatomic) IBOutlet UILabel *computersCurrentCardDescription;
@property (weak, nonatomic) IBOutlet UILabel *computersCurrentCardName;
@property (weak, nonatomic) IBOutlet UILabel *computersCurrentCardCost;

@property (weak, nonatomic) IBOutlet UIImageView *computersDiscardLabel;

@property (weak, nonatomic) IBOutlet UILabel *playersCard0Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard0Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard0Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard1Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard1Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard1Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard2Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard2Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard2Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard3Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard3Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard3Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard4Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard4Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard4Cost;

@property (weak, nonatomic) IBOutlet UILabel *playersCard5Name;
@property (weak, nonatomic) IBOutlet UILabel *playersCard5Description;
@property (weak, nonatomic) IBOutlet UILabel *playersCard5Cost;

@property (weak, nonatomic) IBOutlet UIButton *card0UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card1UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card2UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card3UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card4UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card5UseButton;
@property (weak, nonatomic) IBOutlet UIButton *card0DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card1DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card2DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card3DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card4DiscardButton;
@property (weak, nonatomic) IBOutlet UIButton *card5DiscardButton;

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIImageView *discardedImage;

@property (nonatomic) BOOL soundsOn;

- (IBAction)card0UseButtonPressed:(id)sender;
- (IBAction)card1UseButtonPressed:(id)sender;
- (IBAction)card2UseButtonPressed:(id)sender;
- (IBAction)card3UseButtonPressed:(id)sender;
- (IBAction)card4UseButtonPressed:(id)sender;

- (IBAction)card0DiscardButtonPressed:(id)sender;
- (IBAction)card1DiscardButtonPressed:(id)sender;
- (IBAction)card2DiscardButtonPressed:(id)sender;
- (IBAction)card3DiscardButtonPressed:(id)sender;
- (IBAction)card4DiscardButtonPressed:(id)sender;

- (IBAction)backButtonPressed:(id)sender;

- (IBAction)game:(id)sender;

@end
