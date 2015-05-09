//
//  Player.m
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithRoom:(Room *)room{
    self = [super self];
    
    if (self) {
        _numberOfLives = 2;
        _currentRoom = room;
    }
    
    return self;
}

@end
