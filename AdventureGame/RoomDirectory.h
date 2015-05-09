//
//  RoomDirectory.h
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;
@class Room;

@interface RoomDirectory : NSObject

@property (nonatomic) NSMutableArray *rooms;

-(void)displayInfo:(Player *)player;
-(Room *)allocPlayerStartingRoom;
-(void)movePlayer:(Player *)player toRoom: (Room *)room;
-(BOOL)gameOver:(Player *)player;


@end
