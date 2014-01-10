//
//  PlayingCard.h
//  Matchismo7.0
//
//  Created by Cynosure on 1/8/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;

@property (nonatomic)NSUInteger rank;

+(NSArray *)validSuits;

+(NSUInteger)maxRank;

@end
