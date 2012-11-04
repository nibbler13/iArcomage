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

@property (strong, nonatomic) IBOutlet UILabel *playerQuarries;
@property (strong, nonatomic) IBOutlet UILabel *playerMagics;
@property (strong, nonatomic) IBOutlet UILabel *playerDungeons;
@property (strong, nonatomic) IBOutlet UILabel *playerBricks;
@property (strong, nonatomic) IBOutlet UILabel *playerGems;
@property (strong, nonatomic) IBOutlet UILabel *playerRecruits;
@property (strong, nonatomic) IBOutlet UILabel *playerWall;
@property (strong, nonatomic) IBOutlet UILabel *playerTower;

@property (strong, nonatomic) IBOutlet UILabel *computerQuarries;
@property (strong, nonatomic) IBOutlet UILabel *computerMagics;
@property (strong, nonatomic) IBOutlet UILabel *computerDungeons;
@property (strong, nonatomic) IBOutlet UILabel *computerBricks;
@property (strong, nonatomic) IBOutlet UILabel *computerGems;
@property (strong, nonatomic) IBOutlet UILabel *computerRecruits;
@property (strong, nonatomic) IBOutlet UILabel *computerWall;
@property (strong, nonatomic) IBOutlet UILabel *computerTower;

@property (strong, nonatomic) IBOutlet UILabel *currentCardName;
@property (strong, nonatomic) IBOutlet UILabel *currentCardDescription;
@property (strong, nonatomic) IBOutlet UILabel *currentCardCost;

@property (strong, nonatomic) IBOutlet UILabel *playersCard0Name;
@property (strong, nonatomic) IBOutlet UILabel *playersCard0Description;
@property (strong, nonatomic) IBOutlet UILabel *playersCard0Cost;

@property (strong, nonatomic) IBOutlet UILabel *playersCard1Name;
@property (strong, nonatomic) IBOutlet UILabel *playersCard1Description;
@property (strong, nonatomic) IBOutlet UILabel *playersCard1Cost;

@property (strong, nonatomic) IBOutlet UILabel *playersCard2Name;
@property (strong, nonatomic) IBOutlet UILabel *playersCard2Description;
@property (strong, nonatomic) IBOutlet UILabel *playersCard2Cost;

@property (strong, nonatomic) IBOutlet UILabel *playersCard3Name;
@property (strong, nonatomic) IBOutlet UILabel *playersCard3Description;
@property (strong, nonatomic) IBOutlet UILabel *playersCard3Cost;

@property (strong, nonatomic) IBOutlet UILabel *playersCard4Name;
@property (strong, nonatomic) IBOutlet UILabel *playersCard4Description;
@property (strong, nonatomic) IBOutlet UILabel *playersCard4Cost;

@property (strong, nonatomic) IBOutlet UIButton *card0UseButton;
@property (strong, nonatomic) IBOutlet UIButton *card1UseButton;
@property (strong, nonatomic) IBOutlet UIButton *card2UseButton;
@property (strong, nonatomic) IBOutlet UIButton *card3UseButton;
@property (strong, nonatomic) IBOutlet UIButton *card4UseButton;
@property (strong, nonatomic) IBOutlet UIButton *card0DiscardButton;
@property (strong, nonatomic) IBOutlet UIButton *card1DiscardButton;
@property (strong, nonatomic) IBOutlet UIButton *card2DiscardButton;
@property (strong, nonatomic) IBOutlet UIButton *card3DiscardButton;
@property (strong, nonatomic) IBOutlet UIButton *card4DiscardButton;

@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIImageView *discardedImage;

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
