//
//  OptionsViewController.h
//  iArcomage
//
//  Created by NIBBLER on 1/11/13.
//  Copyright (c) 2013 nibbler13. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OptionsViewControllerDelegate <NSObject>

- (void)needToChangeSoundsLevel;

@end

@interface OptionsViewController : UIViewController

@property (nonatomic, strong) id <OptionsViewControllerDelegate> delegate;

@end
