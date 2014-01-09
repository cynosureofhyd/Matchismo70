//
//  Deck.m
//  Matchismo7.0
//
//  Created by Cynosure on 1/8/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end


@implementation Deck

-(NSMutableArray *)cards
{
    if(!_cards)_cards= [[NSMutableArray alloc]init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop)
    {
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        [self.cards addObject:card];
    }
}

-(Card *)drawRandomCard
{
    Card *drawRandomCard = nil;
    if(self.cards.count)
    {
        unsigned index = arc4random() % self.cards.count;
        drawRandomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return drawRandomCard;
}
@end
