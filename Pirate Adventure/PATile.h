//
//  PATile.h
//  Pirate Adventure
//
//  Created by Dean Williams on 22/08/2014.
//  Copyright (c) 2014 Dean Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAWeapon.h"
#import "PAArmour.h"

@interface PATile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *action;
@property (strong, nonatomic) PAWeapon *weapon;
@property (strong, nonatomic) PAArmour *armour;
@property (nonatomic) int healthEffect;

@end
