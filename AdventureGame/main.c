//
//  main.c
//  AdventureGame
//
//  Created by JIAN WANG on 5/6/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#include <stdio.h>

typedef enum {
    empty,
    cube,
    treasure
}RoomValue;

typedef enum {
    up,
    down,
    left,
    right
}Direction;

typedef struct {
    RoomValue value;
    struct Room *next;
    int roomIndex;
} Room;

typedef struct {
    Room *currentRoom;
    int health;
}Player;

int main(int argc, const char * argv[]) {
    
    return 0;
}
