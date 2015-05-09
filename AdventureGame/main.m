//
//  main.m
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoomDirectory.h"
#import "Player.h"
#import "Room.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Welcome to the Adventure Game! Your goal is to find the treasure in one of the sixteen rooms that are on a 4 * 4 grid. Every room has exits and the direction depends on the room you are in. You have two lives. If the room you enter has a gelatinous cube, you will lose a life. You lost if all your lives were gone.");
        RoomDirectory *roomBoard = [[RoomDirectory alloc] init];
        Player *player = [[Player alloc] initWithRoom:[roomBoard allocPlayerStartingRoom]];
        [roomBoard displayInfo:player];

        while (![player gameOver]) {
            [roomBoard movePlayer:player withDirection:[roomBoard getDirectionFromPlayer:player]];
            [roomBoard displayInfo:player];
        }
        
    }
    return 0;
}