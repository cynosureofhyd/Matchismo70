//
//  CardMatchingGame.h
//  Matchismo7.0
//
//  Created by Cynosure on 1/9/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"    

@interface CardMatchingGame : NSObject

-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex: (NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)int score;



@end
