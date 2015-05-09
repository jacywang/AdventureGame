//
//  Player.h
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Room;

@interface Player : NSObject

@property (nonatomic, assign) int numberOfLives;
@property (nonatomic) Room *currentRoom;

- (instancetype)initWithRoom:(Room *)room;


@end
