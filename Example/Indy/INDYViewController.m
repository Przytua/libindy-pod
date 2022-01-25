//
//  INDYViewController.m
//  Indy
//
//  Created by Łukasz Przytuła on 01/25/2022.
//  Copyright (c) 2022 Łukasz Przytuła. All rights reserved.
//

#import "INDYViewController.h"
#import <IndyWrapper/IndyWrapper-umbrella.h>

@interface INDYViewController ()

@end

@implementation INDYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@", [IndyWallet sharedInstance]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
