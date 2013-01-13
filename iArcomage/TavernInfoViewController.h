//
//  TavernInfoViewController.h
//  iArcomage
//
//  Created by NIBBLER on 1/13/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TavernInfoViewControllerDelegate <NSObject>

- (void)startButtonHasBeenPressed;

@end

@interface TavernInfoViewController : UIViewController

@property (strong) id <TavernInfoViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *tavernNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *towerInitialLabel;
@property (weak, nonatomic) IBOutlet UILabel *wallInitialLabel;
@property (weak, nonatomic) IBOutlet UILabel *towerFinalLabel;
@property (weak, nonatomic) IBOutlet UILabel *resourcesFinalLabel;
@property (weak, nonatomic) IBOutlet UIImageView *tavernImageView;

@end
