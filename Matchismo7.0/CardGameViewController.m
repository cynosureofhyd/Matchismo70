//
//  CardGameViewController.m
//  Matchismo7.0
//
//  Created by Cynosure on 1/8/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic)int flipCount;
@property (strong, nonatomic) Deck *deck;

@end

@implementation CardGameViewController

-(Deck *)deck
{
    if(!_deck)_deck = [[PlayingCardDeck alloc]init];
    return _deck;
}

-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    for(UIButton *cardButton in cardButtons)
    {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips updated to %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    self.flipCount++;
}


@end
