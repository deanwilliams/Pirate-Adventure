//
//  PAFactory.h
//  Pirate Adventure
//
//  Created by Dean Williams on 23/08/2014.
//  Copyright (c) 2014 Dean Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACharacter.h"
#import "PABoss.h"

@interface PAFactory : NSObject

- (NSArray *) tiles;

- (PACharacter *) character;

- (PABoss *) boss;

@end