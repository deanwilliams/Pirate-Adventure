//
//  PAFactory.m
//  Pirate Adventure
//
//  Created by Dean Williams on 23/08/2014.
//  Copyright (c) 2014 Dean Williams. All rights reserved.
//

#import "PAFactory.h"
#import "PATile.h"
#import "PAArmour.h"
#import "PAWeapon.h"

@implementation PAFactory

- (PABoss *) boss
{
    PABoss *boss = [[PABoss alloc] init];
    boss.health = 65;
    return boss;
}

- (PACharacter *) character
{
    PACharacter *character = [[PACharacter alloc] init];
    character.health = 100;
    
    PAArmour *cloakArmour = [[PAArmour alloc] init];
    cloakArmour.name = @"Cloak";
    cloakArmour.health = 5;
    
    character.armour = cloakArmour;
    
    PAWeapon *fistsWeapon = [[PAWeapon alloc] init];
    fistsWeapon.name = @"Fists of Fury";
    fistsWeapon.damage = 10;
    
    character.weapon = fistsWeapon;
    
    return character;
}

- (NSArray *) tiles
{
    PATile *tile1 = [[PATile alloc] init];
    tile1.story = @"1 Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more plunder. Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    PAWeapon *bluntedSword = [[PAWeapon alloc] init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.action = @"Take sword";
    
    PATile *tile2 = [[PATile alloc] init];
    tile2.story = @"2 You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    PAArmour *steelArmour = [[PAArmour alloc] init];
    steelArmour.name = @"Steel Armour";
    steelArmour.health = 8;
    tile2.armour = steelArmour;
    tile2.action = @"Take armour";
    
    PATile *tile3 = [[PATile alloc] init];
    tile3.story = @"3 A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.action = @"Stop at the Docks";
    
    NSArray *column1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    PATile *tile4 = [[PATile alloc] init];
    tile4.story = @"4 You have found a parrot can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    PAArmour *parrotArmour = [[PAArmour alloc] init];
    parrotArmour.health = 20;
    parrotArmour.name = @"I haz a Parrot!";
    tile4.armour = parrotArmour;
    tile4.action = @"Adopt a Parrot";
    
    PATile *tile5 = [[PATile alloc] init];
    tile5.story = @"5 You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    PAWeapon *pistolWeapon = [[PAWeapon alloc] init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.weapon = pistolWeapon;
    tile5.action = @"Take pistol";
    
    PATile *tile6 = [[PATile alloc] init];
    tile6.story = @"6 You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.action = @"Show no fear!";
    
    NSArray *column2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    
    PATile *tile7 = [[PATile alloc] init];
    tile7.story = @"7 You sight a pirate battle off the coast";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = -15;
    tile7.action = @"Fight those scurvy dogs";
    
    PATile *tile8 = [[PATile alloc] init];
    tile8.story = @"8 The legend of the deep, the mighty kraken appears";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.action = @"Abandon Ship";
    
    PATile *tile9 = [[PATile alloc] init];
    tile9.story = @"9 You stumble upon a hidden cave of pirate treasurer";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.action = @"Take treasure";
    
    NSArray *column3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    PATile *tile10 = [[PATile alloc] init];
    tile10.story = @"10 A group of pirates attempts to board your ship";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = 15;
    tile10.action = @"Repel boarders";
    
    PATile *tile11 = [[PATile alloc] init];
    tile11.story = @"11 In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.action = @"Swim deeper";
    
    PATile *tile12 = [[PATile alloc] init];
    tile12.story = @"12 Your final faceoff with the fearsome pirate boss";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.action = @"Fight!";
    
    NSArray *column4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:column1, column2, column3, column4, nil];
    return tiles;
}

@end
