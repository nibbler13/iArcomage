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
            
            [[tavernButtons objectAtIndex:i] imageView].alpha = 0.8;
            [[tavernButtons objectAtIndex:i] imageView].image = [UIImage imageNamed:@"TowerButtonDistorted"];
            
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
    
    controller.towerInitialLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] initialTower]];
    controller.wallInitialLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] initialWall]];
    controller.towerFinalLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] finalTower]];
    controller.resourcesFinalLabel.text = [NSString stringWithFormat:@"%d", [[taverns objectAtIndex:number] finalResources]];
    controller.tavernNameLabel.text = [[taverns objectAtIndex:number] tavernName];
    controller.tavernImageView.image = [UIImage imageNamed:[[taverns objectAtIndex:number] imageForTavern]];
    controller.delegate = self;
    
    UIButton *tempButton = [tavernButtons objectAtIndex:number];
    
    popoverControllerInfo = [[UIPopoverController alloc] initWithContentViewController:controller];
    
    [popoverControllerInfo presentPopoverFromRect:tempButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    selectedTavern = number;
}

- (void)startButtonHasBeenPressed
{
    [popoverControllerInfo dismissPopoverAnimated:YES];
    
    NSString *path = [self savedCampaignGameFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSLog(@"file exist");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        IncompletedGameViewController *incompletedController = [storyboard instantiateViewControllerWithIdentifier:@"IncompletedGameStoryboard"];
        incompletedController.delegate = (id)self;
        
        popoverController = [[UIPopoverController alloc] initWithContentViewController:incompletedController];
        popoverController.delegate = (id)self;
        
        UIButton *tempButton = [tavernButtons objectAtIndex:selectedTavern];
        
        [popoverController presentPopoverFromRect:tempButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        NSLog(@"file dont exist");
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
    NSLog(@"level completed");
    [self.delegate gameHasBeenCompleted];
    
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
        
        [self.delegate gameHasBeenInitiated];
        
        [self presentViewController:startController animated:YES completion:nil];
    }
}

@end
