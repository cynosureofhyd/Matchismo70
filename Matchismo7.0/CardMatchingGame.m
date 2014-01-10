//
//  CardMatchingGame.m
//  Matchismo7.0
//
//  Created by Cynosure on 1/9/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

// The objects in this array would be of class Card
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if(!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}


-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    // Start off the initializer by allowing our super class to initiate first and then checking if self is null or not
    self = [super init];
    if(self){
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if(!card)
                self = nil;
            else
                self.cards[i] = card;
        }
    }
    return self;
}


-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4

-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    // If card is playable set the face up to be opposite of what it currently is
    if(!card.isUnplayable)
    {
        if(!card.isFaceUp)
        {
            // See if flipping this card creates a match
            for (Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable)
                {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore)
                    {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    }
                    else
                    {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
