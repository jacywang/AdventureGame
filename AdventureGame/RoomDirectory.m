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
        
        NSLog(@"Cube is in room %lu and treasure is in room %lu.", cube + 1, treasure + 1);
    }
    
    return self;
}

-(Room *)allocPlayerStartingRoom {
    NSUInteger startingRoomNumber = arc4random_uniform(16);
    Room *startingRoom = self.rooms[startingRoomNumber];
    while ([startingRoom.property isEqualToString:@"Cube"] | [startingRoom.property isEqualToString:@"Treasure" ]) {
        startingRoomNumber = arc4random_uniform(16);
        startingRoom = self.rooms[startingRoomNumber];
    }
    return startingRoom;
}


-(void)displayInfo:(Player *)player {
    Room *currentRoom = player.currentRoom;
    if (!player.gameOver) {
        NSLog(@"You are in room %d with %d lives. And you have exits %@. Choose your exit > ", currentRoom.index, player.numberOfLives, currentRoom.exits);
    }
}

-(void)movePlayer:(Player *)player withDirection:(NSString *)direction {
    int index = player.currentRoom.index;
    if ([direction isEqualTo:@"N"]) {
        index -= 4;
    } else if ([direction isEqualTo:@"S"]) {
        index += 4;
    } else if ([direction isEqualTo:@"W"]) {
        index -= 1;
    } else if ([direction isEqualTo:@"E"]) {
        index += 1;
    }
    player.currentRoom = _rooms[index - 1];
    if ([player.currentRoom.property isEqualToString:@"Cube"]) {
        player.numberOfLives--;
    }
}

-(NSString *)getDirectionFromPlayer:(Player *)player {
    NSArray *directions = player.currentRoom.exits;
    NSString *direction;
    
    do {
        char str[100];
        fgets(str, 100, stdin);
        NSString *input = [[NSString alloc] initWithUTF8String:str];
        direction = [input stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        direction = [direction uppercaseString];
    } while (![directions containsObject:direction]);
    
    NSLog(@"You choose direction %@", direction);
    return direction;
}


@end
