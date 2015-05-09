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
        RoomDirectory *roomBoard = [[RoomDirectory alloc] init];
        Player *player = [[Player alloc] initWithRoom:[roomBoard allocPlayerStartingRoom]];
        
        while (![roomBoard gameOver:player]) {
            [roomBoard displayInfo:player];
            
            break;
        }
        NSLog(@"LALALAL");
    }
    return 0;
}