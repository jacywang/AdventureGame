//
//  RoomDirectory.m
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "RoomDirectory.h"
#import "Room.h"
#import "Player.h"

@implementation RoomDirectory

-(instancetype)init {
    self = [super self];
    
    if (self) {
        _rooms = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 16; i++) {
            Room *newRoom = [[Room alloc] init];
            newRoom.index = i + 1;
            
            if (newRoom.index <= 4) {
                [newRoom.exits removeObject:@"N"];
            }
            
            if (newRoom.index % 4 == 0) {
                [newRoom.exits removeObject:@"E"];
            }
            
            if (newRoom.index % 4 == 1) {
                [newRoom.exits removeObject:@"W"];
            }
            
            if (newRoom.index >= 13) {
                [newRoom.exits removeObject:@"S"];
            }
            
            [_rooms addObject:newRoom];
        }
        
        NSUInteger cube = arc4random_uniform(16);
        [[_rooms objectAtIndex:cube] setProperty:@"Cube"];
        
        NSUInteger treasure = arc4random_uniform(16);
        while (treasure == cube) {
            treasure = arc4random_uniform(16);
        }
        [[_rooms objectAtIndex:treasure] setProperty:@"Treasure"];
        
    }
    
    return self;
}

-(Room *)allocPlayerStartingRoom {
    NSUInteger startingRoomNumber = arc4random_uniform(16) + 1;
    Room *startingRoom = self.rooms[startingRoomNumber];
    while ([startingRoom.property isEqualToString:@"Cube"] | [startingRoom.property isEqualToString:@"Treasure" ]) {
        startingRoomNumber = arc4random_uniform(16) + 1;
        startingRoom = self.rooms[startingRoomNumber];
    }
    return startingRoom;
}


-(void)displayInfo:(Player *)player {
    Room *currentRoom = player.currentRoom;
    NSLog(@"You are in room %d with %d lives. And you have exits %@.", currentRoom.index, player.numberOfLives, currentRoom.exits);
}

-(void)movePlayer:(Player *)player toRoom: (Room *)room {
    player.currentRoom = room;
    if ([room.property isEqualToString:@"Cube"]) {
        player.numberOfLives--;
    }
}

-(BOOL)gameOver:(Player *)player {
    if ([player.currentRoom.property isEqualToString: @"Treasure"]) {
        NSLog(@"You found the treasure! You won!");
        return YES;
    }
    if (player.numberOfLives == 0) {
        NSLog(@"You lost all your lives. You Lost!");
        return YES;
    }
    
    return NO;
}


@end
