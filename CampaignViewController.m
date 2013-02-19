//
//  CampaignViewController.m
//  iArcomage
//
//  Created by NIBBLER on 12/13/12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CampaignViewController.h"
#import "CampaignData.h"

@interface CampaignViewController ()

@property (weak, nonatomic) IBOutlet UIButton *tavernButton0;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton1;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton2;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton3;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton4;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton5;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton6;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton7;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton8;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton9;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton10;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton11;
@property (weak, nonatomic) IBOutlet UIButton *tavernButton12;

- (IBAction)tavernButton0Pressed:(id)sender;
- (IBAction)tavernButton1Pressed:(id)sender;
- (IBAction)tavernButton2Pressed:(id)sender;
- (IBAction)tavernButton3Pressed:(id)sender;
- (IBAction)tavernButton4Pressed:(id)sender;
- (IBAction)tavernButton5Pressed:(id)sender;
- (IBAction)tavernButton6Pressed:(id)sender;
- (IBAction)tavernButton7Pressed:(id)sender;
- (IBAction)tavernButton8Pressed:(id)sender;
- (IBAction)tavernButton9Pressed:(id)sender;
- (IBAction)tavernButton10Pressed:(id)sender;
- (IBAction)tavernButton11Pressed:(id)sender;
- (IBAction)tavernButton12Pressed:(id)sender;

- (IBAction)backButtonPressed:(id)sender;

@end

@implementation CampaignViewController
{
    NSMutableArray *taverns;
    NSArray *tavernButtons;
    NSInteger selectedTavern;
    UIPopoverController *popoverController;
    UIPopoverController *popoverControllerInfo;
    BOOL needToShowVictoryAnimation;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (needToShowVictoryAnimation) {
        
        [self saveCampaignStatus];
        
        [self showDarknessAnimationAtX:[[tavernButtons objectAtIndex:selectedTavern] center].x andY:[[tavernButtons objectAtIndex:selectedTavern] center].y+10];
        
        [UIImageView transitionWithView:[tavernButtons objectAtIndex:selectedTavern]
                               duration:4.5
                                options:UIViewAnimationOptionTransitionCrossDissolve
                             animations:^{
                                 
                                 [[tavernButtons objectAtIndex:selectedTavern] setImage:[UIImage imageNamed:@"test_button"] forState:UIControlStateNormal];
                                 [[tavernButtons objectAtIndex:selectedTavern] setImage:[UIImage imageNamed:@"test_button_high"] forState:UIControlStateHighlighted];
                                 
                                 if (selectedTavern != [tavernButtons count] - 1) {
                                     [[tavernButtons objectAtIndex:selectedTavern + 1] setAlpha:0];
                                     [[tavernButtons objectAtIndex:selectedTavern + 1] setHidden:NO];
                                 }
                                 
                                 [UIImageView animateWithDuration:2.0
                                                            delay:0.0
                                                          options:UIViewAnimationOptionCurveEaseIn
                                                       animations:^{
                                                           if (selectedTavern != [tavernButtons count] - 1) {
                                                               [[tavernButtons objectAtIndex:selectedTavern+1] setAlpha:1];
                                                           }
                                                           
                                                       }completion:^(BOOL finished){
                                                           
                                                       }];

                                 
                             }completion:^(BOOL finished){
                                 [self checkWhichTavernAvailableToPlay];
                             }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    selectedTavern = -1;
    taverns = [[NSMutableArray alloc] init];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self dataFilePath]]) {
        [self loadCampaignStatus];
    } else {
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *finalPath = [path stringByAppendingPathComponent:@"Taverns.plist"];
        NSArray *plistArray = [NSArray arrayWithContentsOfFile:finalPath];
        int x = [plistArray count];
        for (int i = 0; i < x; i++) {
            NSDictionary *info = plistArray[i];
            [taverns addObject:[self fillCampaignDataWithInfo:info]];
        }
        [self saveCampaignStatus];
    }
    
    tavernButtons = [[NSArray alloc] init];
    tavernButtons = @[self.tavernButton0,
                      self.tavernButton1,
                      self.tavernButton2,
                      self.tavernButton3,
                      self.tavernButton4,
                      self.tavernButton5,
                      self.tavernButton6,
                      self.tavernButton7,
                      self.tavernButton8,
                      self.tavernButton9,
                      self.tavernButton10,
                      self.tavernButton11,
                      self.tavernButton12];
    
    [self checkWhichTavernAvailableToPlay];
}

- (CampaignData*)fillCampaignDataWithInfo:(NSDictionary*)info
{
    CampaignData *data = [[CampaignData alloc] init];
    data.tavernName = [info objectForKey:@"tavernName"];
    data.initialTower = [[info objectForKey:@"initialTower"] integerValue];
    data.initialWall = [[info objectForKey:@"initialWall"] integerValue];
    data.finalTower = [[info objectForKey:@"finalTower"] integerValue];
    data.finalResources = [[info objectForKey:@"finalResources"] integerValue];
    data.backgroundPicture = [info objectForKey:@"backgroundPicture"];
    data.towerBackground = [info objectForKey:@"towerBackground"];
    data.towerHeadPlayerBackground = [info objectForKey:@"towerHeadPlayerBackground"];
    data.towerHeadComputerBackground = [info objectForKey:@"towerHeadComputerBackground"];
    data.wallBackground = [info objectForKey:@"wallBackground"];
    data.backgroundMusic = [info objectForKey:@"backgroundMusic"];
    data.imageForTavern = [info objectForKey:@"imageForTavern"];
    data.isAchieved = [[info objectForKey:@"isAchieved"] boolValue];
    return data;
}

- (void)checkWhichTavernAvailableToPlay
{
    for (int i = 0; i < [taverns count]; i++) {
        if ([[taverns objectAtIndex:i] isAchieved]) {
            if (i != [taverns count] - 1) {
                UIButton *tempButton = tavernButtons[i+1];
                tempButton.hidden = NO;
            }
            
            [[tavernButtons objectAtIndex:i] setImage:[UIImage imageNamed:@"test_button"] forState:UIControlStateNormal];
            [[tavernButtons objectAtIndex:i] setImage:[UIImage imageNamed:@"test_button_high"] forState:UIControlStateHighlighted];
        }
    }
}

- (IBAction)tavernButton0Pressed: (id)sender { [self configureTavernViewForNextNumber:0];  }
- (IBAction)tavernButton1Pressed: (id)sender { [self configureTavernViewForNextNumber:1];  }
- (IBAction)tavernButton2Pressed: (id)sender { [self configureTavernViewForNextNumber:2];  }
- (IBAction)tavernButton3Pressed: (id)sender { [self configureTavernViewForNextNumber:3];  }
- (IBAction)tavernButton4Pressed: (id)sender { [self configureTavernViewForNextNumber:4];  }
- (IBAction)tavernButton5Pressed: (id)sender { [self configureTavernViewForNextNumber:5];  }
- (IBAction)tavernButton6Pressed: (id)sender { [self configureTavernViewForNextNumber:6];  }
- (IBAction)tavernButton7Pressed: (id)sender { [self configureTavernViewForNextNumber:7];  }
- (IBAction)tavernButton8Pressed: (id)sender { [self configureTavernViewForNextNumber:8];  }
- (IBAction)tavernButton9Pressed: (id)sender { [self configureTavernViewForNextNumber:9];  }
- (IBAction)tavernButton10Pressed:(id)sender { [self configureTavernViewForNextNumber:10]; }
- (IBAction)tavernButton11Pressed:(id)sender { [self configureTavernViewForNextNumber:11]; }
- (IBAction)tavernButton12Pressed:(id)sender { [self configureTavernViewForNextNumber:12]; }

- (IBAction)backButtonPressed:(id)sender { [self dismissViewControllerAnimated:YES completion:nil]; }

- (void)configureTavernViewForNextNumber:(NSInteger)number
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    
    TavernInfoViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"TavernInfo"];
    
    UIButton *tempButton = [tavernButtons objectAtIndex:number];
    
    popoverControllerInfo = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    controller.towerInitialLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] initialTower]];
    controller.wallInitialLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] initialWall]];
    controller.towerFinalLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] finalTower]];
    controller.resourcesFinalLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] finalResources]];
    controller.tavernNameLabel.text = [[taverns objectAtIndex:number] tavernName];
    controller.tavernImageView.image = [UIImage imageNamed:[[taverns objectAtIndex:number] imageForTavern]];
    controller.delegate = self;
    
    [popoverControllerInfo presentPopoverFromRect:tempButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    selectedTavern = number;
}

- (void)startButtonHasBeenPressed
{
    [popoverControllerInfo dismissPopoverAnimated:YES];
    
    NSString *path = [self savedCampaignGameFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        IncompletedGameViewController *incompletedController = [storyboard instantiateViewControllerWithIdentifier:@"IncompletedGameStoryboard"];
        incompletedController.delegate = (id)self;
        
        popoverController = [[UIPopoverController alloc] initWithContentViewController:incompletedController];
        popoverController.delegate = (id)self;
        
        UIButton *tempButton = [tavernButtons objectAtIndex:selectedTavern];
        
        [popoverController presentPopoverFromRect:tempButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self loadGameWithLoadSave:NO];
    }

}

- (NSString*)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    return documentsDirectory;
}

- (NSString*)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"CampaignProgressSave.plist"];
}

- (NSString*)savedCampaignGameFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:[NSString stringWithFormat:@"campaignSave-%@.plist", [[taverns objectAtIndex:selectedTavern] tavernName]]];
}

- (void)saveCampaignStatus
{
    NSMutableData *campaignData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:campaignData];
    [archiver encodeObject:taverns forKey:@"taverns"];
    [archiver finishEncoding];
    [campaignData writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadCampaignStatus
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        taverns = [unarchiver decodeObjectForKey:@"taverns"];
        [unarchiver finishDecoding];
    }
}

#pragma mark - StartViewContollerDelegate Methods

- (void)levelCompletedWithVictory:(BOOL)victory
{
    [self.delegate gameHasBeenCompleted];
    
    if (victory) {
        if (![[taverns objectAtIndex:selectedTavern] isAchieved]) {
            [taverns[selectedTavern] changeIsAchievedValueTo:YES];
            needToShowVictoryAnimation = YES;
            [self saveCampaignStatus];
        }
    }
}

#pragma mark - Loading level

- (void)needToLoadSavedGame:(BOOL)needToLoad
{
    [popoverController dismissPopoverAnimated:YES];
    [self loadGameWithLoadSave:needToLoad];
}

- (void)loadGameWithLoadSave:(BOOL)load
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    StartViewController *startController = [storyboard instantiateViewControllerWithIdentifier:@"startViewControllerStoryboard"];
    
    startController.needToLoadGame = load;
    
    startController.isThisCampaignPlaying = YES;
    
    if ((selectedTavern != -1)) {
        
        startController.initialTowerValue = [[taverns objectAtIndex:selectedTavern] initialTower];
        startController.initialWallValue = [[taverns objectAtIndex:selectedTavern] initialWall];
        
        startController.towerCampaignAim = [[taverns objectAtIndex:selectedTavern] finalTower];
        startController.resourcesCampaignAim = [[taverns objectAtIndex:selectedTavern] finalResources];
        
        startController.backgroundImage = [[taverns objectAtIndex:selectedTavern] backgroundPicture];
        
        startController.towerImage = [[taverns objectAtIndex:selectedTavern] towerBackground];
        startController.wallImage = [[taverns objectAtIndex:selectedTavern] wallBackground];
        startController.playerTowerHeadImage = [[taverns objectAtIndex:selectedTavern] towerHeadPlayerBackground];
        startController.computerTowerHeadImage = [[taverns objectAtIndex:selectedTavern] towerHeadComputerBackground];
        
        startController.backgroundMusic = [[taverns objectAtIndex:selectedTavern] backgroundMusic];
        startController.levelName = [[taverns objectAtIndex:selectedTavern] tavernName];
        startController.levelNumber = selectedTavern;
        startController.delegate = (id)self;
        
        [self.delegate gameHasBeenInitiated];
        
        startController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:startController animated:YES completion:nil];
    }
}

#pragma mark - Animation

- (void)showDarknessAnimationAtX:(NSInteger)x andY:(NSInteger)y
{
    UIImageView *darknessImage = [[UIImageView alloc] initWithFrame:CGRectMake(-100, -100, 96, 96)];
    darknessImage.animationImages = @[[UIImage imageNamed:@"Darkness00.png"],
                                      [UIImage imageNamed:@"Darkness01.png"],
                                      [UIImage imageNamed:@"Darkness02.png"],
                                      [UIImage imageNamed:@"Darkness03.png"],
                                      [UIImage imageNamed:@"Darkness04.png"],
                                      [UIImage imageNamed:@"Darkness05.png"],
                                      [UIImage imageNamed:@"Darkness06.png"],
                                      [UIImage imageNamed:@"Darkness07.png"],
                                      [UIImage imageNamed:@"Darkness08.png"],
                                      [UIImage imageNamed:@"Darkness09.png"],
                                      [UIImage imageNamed:@"Darkness10.png"],
                                      [UIImage imageNamed:@"Darkness11.png"],
                                      [UIImage imageNamed:@"Darkness12.png"],
                                      [UIImage imageNamed:@"Darkness13.png"],
                                      [UIImage imageNamed:@"Darkness14.png"],
                                      [UIImage imageNamed:@"Darkness15.png"],
                                      [UIImage imageNamed:@"Darkness16.png"],
                                      [UIImage imageNamed:@"Darkness17.png"],
                                      [UIImage imageNamed:@"Darkness18.png"],
                                      [UIImage imageNamed:@"Darkness19.png"],
                                      [UIImage imageNamed:@"Darkness20.png"],
                                      [UIImage imageNamed:@"Darkness21.png"],
                                      [UIImage imageNamed:@"Darkness22.png"],
                                      [UIImage imageNamed:@"Darkness23.png"],
                                      [UIImage imageNamed:@"Darkness24.png"],
                                      [UIImage imageNamed:@"Darkness25.png"],
                                      [UIImage imageNamed:@"Darkness26.png"],
                                      [UIImage imageNamed:@"Darkness27.png"],
                                      [UIImage imageNamed:@"Darkness28.png"],
                                      [UIImage imageNamed:@"Darkness29.png"]];
    darknessImage.center = CGPointMake(x, y);
    darknessImage.animationDuration = 3.0;
    darknessImage.animationRepeatCount = 1;
    [darknessImage startAnimating];
    [self.view addSubview:darknessImage];
}

@end
