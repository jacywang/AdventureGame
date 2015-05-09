//
//  Player.m
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "Player.h"
#import "Room.h"

@implementation Player

- (instancetype)initWithRoom:(Room *)room{
    self = [super self];
    
    if (self) {
        _numberOfLives = 2;
        _currentRoom = room;
    }
    
    return self;
}

-(BOOL)gameOver{
    if ([self.currentRoom.property isEqualToString: @"Treasure"]) {
        NSLog(@"You found the treasure! You won!");
        return YES;
    }
    if (self.numberOfLives == 0) {
        NSLog(@"You lost all your lives. You Lost!");
        return YES;
    }
    
    return NO;
}

@end
