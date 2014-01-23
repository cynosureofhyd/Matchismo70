//
//  GameResult.h
//  Matchismo7.0
//
//  Created by Prashanth Yerramilli on 1/21/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

+(NSArray *)allGameResults;


@end
