//
//  RootNavigationController.m
//  LockFoo
//
//  Created by Wayne Cochran on 6/12/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "RootNavigationController.h"
#import "LoginTableViewController.h"
#import "AppDelegate.h"

@interface RootNavigationController () <LoginDelegate>
@property (assign, nonatomic) BOOL presentingLoginController;
-(void) applicationDidBecomeActive:(NSNotification*) notification;
@end

@implementation RootNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    NSLog(@"RootNavigationController:didLogin");
    self.presentingLoginController = NO;
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"VRootNavigationController:ViewDidAppear:");
    [super viewDidAppear:animated];
    [self loginIfNecessary];
}

-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"VRootNavigationController:viewWillDisappear:");
}

-(void) applicationDidBecomeActive:(NSNotification*) notification {
    NSLog(@"ViewController:applicationDidBecomeActive:");
    [self loginIfNecessary];
}

@end
