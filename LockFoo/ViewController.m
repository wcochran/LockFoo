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

@interface ViewController () <LoginDelegate>
@property (assign, nonatomic) BOOL presentingLoginController;
-(void) applicationDidBecomeActive:(NSNotification*) notification;
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ViewControll:viewDidLoad");
    self.presentingLoginController = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loginIfNecessary {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (!appDelegate.userLoggedIn && !self.presentingLoginController) {
        self.presentingLoginController = YES;
        [self performSegueWithIdentifier:@"RootLoginSegue" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"RootLoginSegue"]) {
        UINavigationController *navController = segue.destinationViewController;
        LoginTableViewController *loginController = (LoginTableViewController *) navController.topViewController;
        loginController.loginDelegate = self;
    }
}

-(void)didLogin {
    NSLog(@"ViewController:didLogin");
    self.presentingLoginController = NO;
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"ViewController:ViewDidAppear:");
    [super viewDidAppear:animated];
    [self loginIfNecessary];
}

-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"ViewController:viewWillDisappear:");
}

-(void) applicationDidBecomeActive:(NSNotification*) notification {
    NSLog(@"ViewController:applicationDidBecomeActive:");
    [self loginIfNecessary];
}

@end
