//
//  ScoreViewController.m
//  iArcomage
//
//  Created by NIBBLER on 15.10.12.
//  Copyright (c) 2012 nibbler13. All rights reserved.
//

#import "ScoreViewController.h"
#import "ScoreSystem.h"

@interface ScoreViewController ()

@property (weak, nonatomic) IBOutlet UILabel *totalGameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamesWinnedLabel;
@property (weak, nonatomic) IBOutlet UILabel *byTowerConstructionLabel;
@property (weak, nonatomic) IBOutlet UILabel *byResourceCollectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *byTowerDestructionLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamesLossLabel;

- (IBAction)backButtonPressed:(id)sender;

@end

@implementation ScoreViewController
{
    NSInteger gamesPlayed;
    NSInteger gamesWined;
    ScoreSystem *score;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    score = [[ScoreSystem alloc] init];
    
    self.totalGameLabel.text = [NSString stringWithFormat:@"%ld", (score.winnedByDestruction + score.winnedByConstruction + score.winnedByCollection + score.lossesGames)];
    self.gamesWinnedLabel.text = [NSString stringWithFormat:@"%ld", (score.winnedByDestruction + score.winnedByConstruction + score.winnedByCollection)];
    self.byTowerConstructionLabel.text = [NSString stringWithFormat:@"%ld", (long)score.winnedByConstruction];
    self.byResourceCollectionLabel.text = [NSString stringWithFormat:@"%ld", (long)score.winnedByCollection];
    self.byTowerDestructionLabel.text = [NSString stringWithFormat:@"%ld", (long)score.winnedByDestruction];
    self.gamesLossLabel.text = [NSString stringWithFormat:@"%ld", (long)score.lossesGames];
}

- (IBAction)backButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
