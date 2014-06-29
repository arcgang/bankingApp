//
//  STLoginViewController.h
//  SunTrust
//
//  Created by Archan Ganguly on 6/16/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STLoginViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField * usernameField;

@property (nonatomic, weak) IBOutlet UITextField * passwordField;

@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@property (nonatomic, weak) IBOutlet UIButton * forgotButton;

@property (nonatomic, weak) IBOutlet UILabel * titleLabel;

@property (nonatomic, weak) IBOutlet UIImageView * headerImageView;

@property (nonatomic, weak) IBOutlet UIView * infoView;

@property (nonatomic, weak) IBOutlet UILabel * infoLabel;

@property (nonatomic, weak) IBOutlet UIView * overlayView;

- (IBAction)getCustomer;

@end
