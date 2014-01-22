//
//  GameResult.m
//  Matchismo7.0
//
//  Created by Prashanth Yerramilli on 1/21/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "GameResult.h"

@interface GameResult()

@property (readwrite, nonatomic)NSDate *start;
@property (readwrite, nonatomic)NSDate *end;

@end

@implementation GameResult

#define ALL_RESULTS_KEY @"GameResult_All"

+(NSArray *)allGameResults
{
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    
    for(id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues])
    {
        GameResult *result = [[GameResult alloc] initFromPropertyList: plist];
        [allGameResults addObject:result];
    }
    return allGameResults;
}


// convienience initializer
-(id)initFromPropertyList:(id)plist
{
    self = [self init];
    if (self) {
        
    }
    return self;
}

-(void)synchronize
{
    // mutable copy is because when we pull something from user defaults its mutable. And when we pull it out its immutable. Hence we have to specifically ask for mutableCopy
    NSMutableDictionary *mutableGameResultsFromUserDefaults =
    [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if(!mutableGameResultsFromUserDefaults)
        mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
    mutableGameResultsFromUserDefaults[[self.start description] ] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

-(id)asPropertyList
{
    return @{ START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score) };
}

// designated initializer
-(id)init
{
    self = [super init];
    if(self)
    {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

-(NSTimeInterval) duration
{
    return  [self.end timeIntervalSinceDate:self.start];
}

-(void)setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}
@end
