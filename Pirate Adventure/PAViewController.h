//
//  PAViewController.h
//  Pirate Adventure
//
//  Created by Dean Williams on 22/08/2014.
//  Copyright (c) 2014 Dean Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PACharacter.h"
#import "PABoss.h"

@interface PAViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armourLabel;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;

@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

@property (strong, nonatomic) NSArray *tiles;
@property (nonatomic, readwrite) CGPoint currentPosition;
@property (strong, nonatomic) PACharacter *character;
@property (strong, nonatomic) PABoss *boss;

- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)resetButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;

@end
