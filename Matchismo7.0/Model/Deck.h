//
//  Deck.h
//  Matchismo7.0
//
//  Created by Cynosure on 1/8/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;

@end
