//
//  Room.h
//  AdventureGame
//
//  Created by JIAN WANG on 5/9/15.
//  Copyright (c) 2015 JWANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Room : NSObject

@property (nonatomic, assign) int index;
@property (nonatomic) NSMutableArray *exits;
@property (nonatomic) NSString *property;

@end
