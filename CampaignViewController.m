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

@property (weak, nonatomic) IBOutlet UIButton *startButton;

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

@property (weak, nonatomic) IBOutlet UILabel *tavernNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *initialTowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *initialWallLabel;
@property (weak, nonatomic) IBOutlet UILabel *finalTowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *finalResourcesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tavernImageView;

- (IBAction)tavernCloseButtonPressed:(id)sender;
- (IBAction)tavernStartButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *shadowView;

@property (weak, nonatomic) IBOutlet UIView *selectedTavernView;

@end

@implementation CampaignViewController
{
    NSMutableArray *taverns;
    NSArray *tavernButtons;
    NSInteger selectedTavern;
    UIPopoverController *popoverController;
    BOOL needToShowVictoryAnimation;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"campaign view will apear");
}

- (void)viewDidLoad
{
    NSLog(@"campaign view did load");
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
    NSLog(@"CheckWhichTavernAvailable");
    for (int i = 0; i < [taverns count]; i++) {
        if ([[taverns objectAtIndex:i] isAchieved]) {
            if (i != [taverns count] - 1) {
                UIButton *tempButton = tavernButtons[i+1];
                tempButton.hidden = NO;
            }
            
            if (i == selectedTavern && needToShowVictoryAnimation) {
                NSLog(@"need to show animation");
            }
            
            UIImageView *tempImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"completed"]];
            UIButton *tempButton = tavernButtons[i];
            tempImage.center = tempButton.center;
            //tempImage.alpha = 0.3;
            //[[tavernButtons objectAtIndex:i] imageView].alpha = 0.6;
            [self.view insertSubview:tempImage belowSubview:self.tavernButton0];
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

- (IBAction)tavernCloseButtonPressed:(id)sender
{
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationCurveEaseIn
                     animations:^{
                         self.selectedTavernView.center = CGPointMake(512, 1000);
                     }completion:^(BOOL finished){
                         self.selectedTavernView.hidden = YES;
                         [self setAllTavernButonsEnableStatusTo:YES];
                         self.shadowView.hidden = YES;
                         [self checkWhichTavernAvailableToPlay];
                     }];
}

- (IBAction)tavernStartButtonPressed:(id)sender
{
    NSLog(@"tavernStartButtonPressed");
    NSString *path = [self savedCampaignGameFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSLog(@"file exist");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        IncompletedGameViewController *incompletedController = [storyboard instantiateViewControllerWithIdentifier:@"IncompletedGameStoryboard"];
        incompletedController.delegate = (id)self;
        
        popoverController = [[UIPopoverController alloc] initWithContentViewController:incompletedController];
        popoverController.delegate = (id)self;
        [popoverController presentPopoverFromRect:self.startButton.frame inView:self.selectedTavernView permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
        
    } else {
        NSLog(@"file dont exist");
        [self loadGameWithLoadSave:NO];
    }
}

- (void)setAllTavernButonsEnableStatusTo:(BOOL)status
{
    self.tavernButton0.enabled = status;
    self.tavernButton1.enabled = status;
    self.tavernButton2.enabled = status;
    self.tavernButton3.enabled = status;
    self.tavernButton4.enabled = status;
    self.tavernButton5.enabled = status;
    self.tavernButton6.enabled = status;
    self.tavernButton7.enabled = status;
    self.tavernButton8.enabled = status;
    self.tavernButton9.enabled = status;
    self.tavernButton10.enabled = status;
    self.tavernButton11.enabled = status;
    self.tavernButton12.enabled = status;
}

- (void)configureTavernViewForNextNumber:(NSInteger)number
{
    [self setAllTavernButonsEnableStatusTo:NO];
    self.shadowView.hidden = NO;
    
    self.initialTowerLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] initialTower]];
    self.initialWallLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] initialWall]];
    self.finalTowerLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] finalTower]];
    self.finalResourcesLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] finalResources]];
    self.tavernNameLabel.text = [[taverns objectAtIndex:number] tavernName];
    self.tavernImageView.image = [UIImage imageNamed:[[taverns objectAtIndex:number] imageForTavern]];
    
    self.selectedTavernView.center = CGPointMake(512, 1000);
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationTransitionCurlUp
                     animations:^{
                         self.selectedTavernView.hidden = NO;
                         self.selectedTavernView.center = CGPointMake(512, 384);
                         selectedTavern = number;
                     }completion:^(BOOL finished){
                         
                     }];
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
    NSLog(@"selectedTavern: %d", selectedTavern);
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
    if (victory) {
        if (![[taverns objectAtIndex:selectedTavern] isAchieved]) {
            [taverns[selectedTavern] changeIsAchievedValueTo:YES];
            needToShowVictoryAnimation = YES;
            [self checkWhichTavernAvailableToPlay];
            [self saveCampaignStatus];
        }
    }
}

#pragma mark - Loading level

- (void)needToLoadSavedGame:(BOOL)needToLoad
{
    NSLog(@"button: %d", needToLoad);
    [popoverController dismissPopoverAnimated:YES];
    [self loadGameWithLoadSave:needToLoad];
}

- (void)loadGameWithLoadSave:(BOOL)load
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    StartViewController *startController = [storyboard instantiateViewControllerWithIdentifier:@"startViewControllerStoryboard"];
    
    startController.needToLoadGame = load;
    startController.soundsOn = self.soundsOn;
    
    [self tavernCloseButtonPressed:nil];
    
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
        startController.delegate = (id)self;
        
        [self presentViewController:startController animated:YES completion:nil];
    }
}

@end
