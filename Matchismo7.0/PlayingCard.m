//
//  PlayingCard.m
//  Matchismo7.0
//
//  Created by Cynosure on 1/8/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+(NSArray *)rankStrings
{
     NSArray *rankStrings = @[@"?", @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"J", @"Q", @"K"];
    return rankStrings;
}


-(int)match:(NSArray *)otherCards
{
    int score = 0;
    // We will match only a single other card
    if(otherCards.count == 1)
    {
        PlayingCard *otherCard = [otherCards lastObject];
        if([otherCard isKindOfClass:[PlayingCard class]])
        {
            if([otherCard.suit isEqualToString:self.suit])
                score  = 1;
            else if(otherCard.rank == self.rank)
            {
                score = 4;
            }
        }
    }
    return score;
}

+(NSUInteger)maxRank
{
    return [self rankStrings].count - 1;
}

@synthesize suit = _suit;

+(NSArray *)validSuits
{
    static NSArray *validSuits = nil;
    if(!validSuits)
        validSuits = @[@"♥︎", @"♦︎", @"♠︎", @"♣︎"];
    return validSuits;
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}


-(void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit])
        _suit = suit;
}

@end
