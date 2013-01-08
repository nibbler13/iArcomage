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
@property (strong, nonatomic) IBOutlet UISwitch *SoundSwitcher;

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
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"02-Tourdion" ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    avPlayer.numberOfLoops = -1;
    avPlayer.volume = 0.0;
    
    [avPlayer play];
    
    [self doVolumeUp];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self doVolumeFade];
    
    [super viewWillDisappear:animated];
}

-(void)doVolumeFade
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
    if (avPlayer.volume < 0.4) {
        avPlayer.volume = avPlayer.volume + 0.05;
        [self performSelector:@selector(doVolumeUp) withObject:nil afterDelay:0.2];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toCampaign"]) {
        CampaignViewController *controller = [segue destinationViewController];
        controller.soundsOn = self.SoundSwitcher.on;
    }
}

#pragma mark - Button Functions
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
    startController.soundsOn = self.SoundSwitcher.on;
    [self presentViewController:startController animated:YES completion:nil];
}


@end
