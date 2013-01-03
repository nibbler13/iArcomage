//
//  ViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "MainViewController.h"
#import "StartViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) IBOutlet UISwitch *SoundSwitcher;
@property (weak, nonatomic) IBOutlet UIView *incompletedGameView;

- (IBAction)quickGameButton:(id)sender;
- (IBAction)yesButton:(id)sender;
- (IBAction)noButton:(id)sender;

@end

@implementation MainViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toStart"]) {
        StartViewController *controller = [segue destinationViewController];
        controller.soundsOn = self.SoundSwitcher.on;
    }
}

//ButtonFunction
- (IBAction)quickGameButton:(id)sender {
    NSLog(@"quickGameButton");
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSLog(@"file exist");
        self.incompletedGameView.hidden = NO;
    } else {
        NSLog(@"file dont exist");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        NSLog(@"storyboard: %@", storyboard);
        StartViewController *startController = [storyboard instantiateViewControllerWithIdentifier:@"startViewControllerStoryboard"];
        NSLog(@"controller: %@", startController);
        self.incompletedGameView.hidden = YES;
        startController.needToLoadGame = NO;
        startController.soundsOn = self.SoundSwitcher.on;
        [self presentViewController:startController animated:YES completion:nil];
    }
}

- (IBAction)yesButton:(id)sender {
    NSLog(@"yes");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSLog(@"storyboard: %@", storyboard);
    StartViewController *startController = [storyboard instantiateViewControllerWithIdentifier:@"startViewControllerStoryboard"];
    NSLog(@"controller: %@", startController);
    self.incompletedGameView.hidden = YES;
    startController.needToLoadGame = YES;
    startController.soundsOn = self.SoundSwitcher.on;
    [self presentViewController:startController animated:YES completion:nil];
}

- (IBAction)noButton:(id)sender {
    NSLog(@"no");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    NSLog(@"storyboard: %@", storyboard);
    StartViewController *startController = [storyboard instantiateViewControllerWithIdentifier:@"startViewControllerStoryboard"];
    NSLog(@"controller: %@", startController);
    self.incompletedGameView.hidden = YES;
    startController.needToLoadGame = NO;
    startController.soundsOn = self.SoundSwitcher.on;
    [self presentViewController:startController animated:YES completion:nil];
}

//Check saved data

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

@end
