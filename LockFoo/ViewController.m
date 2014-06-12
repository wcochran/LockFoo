//
//  ViewController.m
//  LockFoo
//
//  Created by Wayne Cochran on 6/10/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "LoginTableViewController.h"

@interface ViewController ()
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewControllerfoo:viewDidLoad");
}


-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"ViewController:ViewDidAppear:");
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"ViewController:viewWillDisappear:");
}

@end
