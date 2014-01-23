//
//  GameResultViewController.m
//  Matchismo7.0
//
//  Created by Prashanth Yerramilli on 1/21/14.
//  Copyright (c) 2014 Cynosure. All rights reserved.
//

#import "GameResultViewController.h"

@interface GameResultViewController ()

@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameResultViewController

-(void)setup
{
    // initialization that can't wait until viewDidLoad
}

-(void)awakeFromNib
{
    [self setup];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

        // Custom initialization
    [self setup];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
