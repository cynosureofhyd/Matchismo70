//
//  CardGameViewController.m
//  Matchismo7.0
//
//  Created by Cynosure on 1/8/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (nonatomic)int flipCount;

@end



@implementation CardGameViewController

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
