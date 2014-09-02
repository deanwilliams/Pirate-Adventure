//
//  PAViewController.m
//  Pirate Adventure
//
//  Created by Dean Williams on 22/08/2014.
//  Copyright (c) 2014 Dean Williams. All rights reserved.
//

#import "PAViewController.h"
#import "PAFactory.h"
#import "PATile.h"

@interface PAViewController ()

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self resetGameState];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper methods

- (void) resetGameState
{
    self.character = nil;
    self.boss = nil;
    
    self.currentPosition = CGPointMake(0, 0);
    
    PAFactory *factory = [[PAFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    [self updateCharacterStatsForArmour:nil withWeapon:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
}

- (void) updateTile
{
    PATile *tileModel = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    
    self.storyLabel.text = tileModel.story;
    self.backgroundImage.image = tileModel.backgroundImage;
    
    self.healthLabel.text = [NSString stringWithFormat: @"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat: @"%i", self.character.damage];
    self.armourLabel.text = self.character.armour.name;
    self.weaponLabel.text = self.character.weapon.name;
    
    [self.actionButton setTitle:tileModel.action forState:UIControlStateNormal];
}

- (void) updateCharacterStatsForArmour: (PAArmour *) armour withWeapon: (PAWeapon *) weapon withHealthEffect: (int) healthEffect
{
    if (armour){
        self.character.health = self.character.health - self.character.armour.health + armour.health;
        self.character.armour = armour;
    } else if (weapon){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    } else if (healthEffect != 0){
        self.character.health = self.character.health + healthEffect;
    } else {
        self.character.health = self.character.health + self.character.armour.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

// Check whether a tile exists at the supplied position
- (BOOL) tileExistsAtPoint: (CGPoint) point
{
    if (point.x >= 0 && point.y >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return YES;
    } else {
        return NO;
    }
}

// Update which buttons are visible based on
// our current position in the tile grid
- (void) updateButtons
{
    self.northButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPosition.x, self.currentPosition.y + 1)];
    
    self.eastButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPosition.x + 1, self.currentPosition.y)];
    
    self.westButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPosition.x - 1, self.currentPosition.y)];
    
    self.southButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPosition.x, self.currentPosition.y - 1)];
}

#pragma mark - IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    PATile *tileModel = [[self.tiles objectAtIndex:self.currentPosition.x] objectAtIndex:self.currentPosition.y];
    if (self.currentPosition.x == 3 && self.currentPosition.y == 2) {
        // Boss tile
        self.boss.health = self.boss.health - self.character.damage;
    }
    [self updateCharacterStatsForArmour:tileModel.armour withWeapon:tileModel.weapon withHealthEffect:tileModel.healthEffect];
    
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    } else if (self.boss.health <=0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory" message:@"You have defeated the dread Pirate Roberts!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }
    
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    [self resetGameState];
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y + 1);
    
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPosition = CGPointMake(self.currentPosition.x + 1, self.currentPosition.y);
    
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPosition = CGPointMake(self.currentPosition.x, self.currentPosition.y - 1);
    
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPosition = CGPointMake(self.currentPosition.x - 1, self.currentPosition.y);
    
    [self updateButtons];
    [self updateTile];
}

@end
