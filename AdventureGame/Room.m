//
//  Room.m
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import "Room.h"

@implementation Room

-(instancetype)init {
    self = [super init];
    
    if (self) {
        _exits = [[NSMutableArray alloc] initWithArray:@[@"N", @"S", @"W", @"E"]];
    }
    
    return self;
}

@end
