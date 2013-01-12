//
//  ViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "MainViewController.h"
#import "StartViewController.h"
#import "SoundSystem.h"

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
    SoundSystem *soundSystem;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSLog(@"%d", [[NSUserDefaults standardUserDefaults] boolForKey:@"isThisNotTheFirstTime"]);
    NSLog(@"%f", [[NSUserDefaults standardUserDefaults] floatForKey:@"musicVolume"]);
    NSLog(@"%f", [[NSUserDefaults standardUserDefaults] floatForKey:@"soundVolume"]);
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"isThisNotTheFirstTime"]) {
        NSLog(@"init first value of sounds");
        [[NSUserDefaults standardUserDefaults] setFloat:1.0 forKey:@"musicVolume"];
        [[NSUserDefaults standardUserDefaults] setFloat:1.0 forKey:@"soundVolume"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isThisNotTheFirstTime"];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![soundSystem isMusicPlaying]) {
        soundSystem = [[SoundSystem alloc] initWithFileName:@"02-Tourdion"];
    }
}

- (void)needToChangeSoundsLevel
{
    [soundSystem updateSoundVolume];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toCampaign"]) {
        CampaignViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

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
    
    [soundSystem stopMusic];
    
    [self presentViewController:startController animated:YES completion:nil];
}

#pragma mark - CampaignViewControllerDelegate method

- (void)gameHasBeenInitiated
{
    [soundSystem stopMusic];
}

- (void)gameHasBeenCompleted
{
    //NSLog(@"gamehasveen");
    soundSystem = [[SoundSystem alloc] initWithFileName:@"02-Tourdion"];
}


@end
