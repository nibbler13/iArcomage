//
//  CampaignViewController.m
//  iArcomage
//
//  Created by NIBBLER on 12/13/12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "CampaignViewController.h"
#import "CampaignData.h"
#import "StartViewController.h"

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
}

- (void)viewDidLoad
{
    selectedTavern = -1;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"Taverns.plist"];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:finalPath];
    taverns = [[NSMutableArray alloc] init];
    int x = [plistArray count];
    for (int i = 0; i < x; i++) {
        NSDictionary *info = plistArray[i];
        [taverns addObject:[self fillCampaignDataWithInfo:info]];
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
        
        UIImageView *tempImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Completed"]];
        UIButton *tempButton = tavernButtons[i];
        tempImage.center = tempButton.center;
        [self.view insertSubview:tempImage belowSubview:self.selectedTavernView];
    
        }
    }
}

- (IBAction)tavernButton0Pressed:(id)sender {
    [self configureTavernViewForNextNumber:0];
}

- (IBAction)tavernButton1Pressed:(id)sender {
    [self configureTavernViewForNextNumber:1];
}

- (IBAction)tavernButton2Pressed:(id)sender {
    [self configureTavernViewForNextNumber:2];
}

- (IBAction)tavernButton3Pressed:(id)sender {
    [self configureTavernViewForNextNumber:3];
}

- (IBAction)tavernButton4Pressed:(id)sender {
    [self configureTavernViewForNextNumber:4];
}

- (IBAction)tavernButton5Pressed:(id)sender {
    [self configureTavernViewForNextNumber:5];
}

- (IBAction)tavernButton6Pressed:(id)sender {
    [self configureTavernViewForNextNumber:6];
}

- (IBAction)tavernButton7Pressed:(id)sender {
    [self configureTavernViewForNextNumber:7];
}

- (IBAction)tavernButton8Pressed:(id)sender {
    [self configureTavernViewForNextNumber:8];
}

- (IBAction)tavernButton9Pressed:(id)sender {
    [self configureTavernViewForNextNumber:9];
}

- (IBAction)tavernButton10Pressed:(id)sender {
    [self configureTavernViewForNextNumber:10];
}

- (IBAction)tavernButton11Pressed:(id)sender {
    [self configureTavernViewForNextNumber:11];
}

- (IBAction)tavernButton12Pressed:(id)sender {
    [self configureTavernViewForNextNumber:12];
}

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tavernCloseButtonPressed:(id)sender {
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationCurveEaseIn
                     animations:^{
                         self.selectedTavernView.center = CGPointMake(512, 1000);
                     }completion:^(BOOL finished){
                         self.selectedTavernView.hidden = YES;
                         [self setAllTavernButonsEnableStatusTo:YES];
                         self.shadowView.hidden = YES;
                     }];
}

- (IBAction)tavernStartButtonPressed:(id)sender {
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
                     }completion:^(BOOL finished){
                         selectedTavern = number;
                     }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toStartFromCampaign"]) {
        StartViewController *controller = [segue destinationViewController];
        
        [self tavernCloseButtonPressed:nil];
        
        //THIS IS NEED TO FIX
        controller.soundsOn = YES;
        controller.isThisCampaignPlaying = YES;
        
        if ((selectedTavern != -1)) {
            controller.initialTowerValue = [[taverns objectAtIndex:selectedTavern] initialTower];
            controller.initialWallValue = [[taverns objectAtIndex:selectedTavern] initialWall];
            controller.towerCampaignAim = [[taverns objectAtIndex:selectedTavern] finalTower];
            
            controller.backgroundImage = [[taverns objectAtIndex:selectedTavern] backgroundPicture];
            
            controller.towerImage = [[taverns objectAtIndex:selectedTavern] towerBackground];
            controller.wallImage = [[taverns objectAtIndex:selectedTavern] wallBackground];
            controller.playerTowerHeadImage = [[taverns objectAtIndex:selectedTavern] towerHeadPlayerBackground];
            controller.computerTowerHeadImage = [[taverns objectAtIndex:selectedTavern] towerHeadComputerBackground];
            
            controller.backgroundMusic = [[taverns objectAtIndex:selectedTavern] backgroundMusic];
        }
    }
}

@end