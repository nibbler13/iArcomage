//
//  ViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "MainViewController.h"
#import "StartViewController.h"
#import "CampaignViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIButton *quickButton;
@property (weak, nonatomic) IBOutlet UIView *incompletedGameView;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;

- (IBAction)soundsButtonPressed:(id)sender;
- (IBAction)quickGameButton:(id)sender;

@end

@implementation MainViewController
{
    UIPopoverController *popoverController;
    AVAudioPlayer *avPlayer;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setSoundButtonImageForValue];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"02-Tourdion" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    avPlayer.numberOfLoops = -1;
    avPlayer.volume = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"];
    
    [avPlayer play];
    
    //[self doVolumeUp];
}

- (void)needToChangeSoundsLevel
{
    avPlayer.volume = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"];
    [self setSoundButtonImageForValue];
}

- (void)viewWillDisappear:(BOOL)animated
{
    //[self doVolumeFade];
    
    [avPlayer stop];
    
    [super viewWillDisappear:animated];
}

/*-(void)doVolumeFade
{
    if (avPlayer.volume > 0.05) {
        avPlayer.volume = avPlayer.volume - 0.05;
        [self performSelector:@selector(doVolumeFade) withObject:nil afterDelay:0.2];
    } else {
        [avPlayer stop];
    }
}

-(void)doVolumeUp
{
    if (avPlayer.volume < [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"]) {
        avPlayer.volume = avPlayer.volume + 0.05;
        [self performSelector:@selector(doVolumeUp) withObject:nil afterDelay:0.2];
    }
}*/

/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toCampaign"]) {
        CampaignViewController *controller = [segue destinationViewController];
        //controller.soundsOn = self.SoundSwitcher.on;
    }
}*/

#pragma mark - Button Functions
- (IBAction)soundsButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    OptionsViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"OptionsView"];
    controller.delegate = self;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
    popoverController.delegate = self;
    [popoverController presentPopoverFromRect:self.soundButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

- (IBAction)quickGameButton:(id)sender {
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSLog(@"file exist");
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        IncompletedGameViewController *incompletedController = [storyboard instantiateViewControllerWithIdentifier:@"IncompletedGameStoryboard"];
        incompletedController.delegate = (id)self;
        
        popoverController = [[UIPopoverController alloc] initWithContentViewController:incompletedController];
        popoverController.delegate = (id)self;
        [popoverController presentPopoverFromRect:self.quickButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {
        NSLog(@"file dont exist");
        [self loadGameWithLoadSave:NO];
    }
}

#pragma mark - Saved Files

- (NSString*)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = paths[0];
    return documentsDirectory;
}

- (NSString*)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"quickGameSave.plist"];
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
    //startController.soundsOn = self.SoundSwitcher.on;
    [self presentViewController:startController animated:YES completion:nil];
}

- (void)setSoundButtonImageForValue
{
    float value = [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"];
    
    NSLog(@"floatValue: %f", value);
    
    if (value == 0.0) {
        [self.soundButton setImage:[UIImage imageNamed:@"Sound5"] forState:UIControlStateNormal];
        NSLog(@"1");
    } else if (value > 0.0 && value < 0.33) {
        [self.soundButton setImage:[UIImage imageNamed:@"Sound4"] forState:UIControlStateNormal];
        NSLog(@"2");
    } else if (value >= 0.33 && value < 0.66) {
        [self.soundButton setImage:[UIImage imageNamed:@"Sound3"] forState:UIControlStateNormal];
        NSLog(@"3");
    } else if (value >= 0.66) {
        [self.soundButton setImage:[UIImage imageNamed:@"Sound"] forState:UIControlStateNormal];
        NSLog(@"4");
    }
}


@end
