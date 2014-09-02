//
//  PACharacter.h
//  Pirate Adventure
//
//  Created by Dean Williams on 23/08/2014.
//  Copyright (c) 2014 Dean Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAWeapon.h"
#import "PAArmour.h"

@interface PACharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;

@property (strong, nonatomic) PAWeapon *weapon;
@property (strong, nonatomic) PAArmour *armour;

@end
