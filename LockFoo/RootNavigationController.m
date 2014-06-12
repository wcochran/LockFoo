//
//  RootNavigationController.m
//  LockFoo
//
//  Created by Wayne Cochran on 6/12/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "RootNavigationController.h"
#import "LoginTableViewController.h"

@interface RootNavigationController () <LoginDelegate>
@property (assign, nonatomic) BOOL userLoggedIn;
@property (strong, nonatomic) NSDate *backgroundTime;
@property (assign, nonatomic) BOOL presentingLoginController;
//XXX @property (strong, nonatomic) UIImageView *lockImageView;
-(void)applicationDidBecomeActive:(NSNotification*) notification;
// XXX -(void)applicationDidEnterBackground:(NSNotification*) notification;
-(void)applicationWillResignActive:(NSNotification*) notification;
@end

@implementation RootNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(applicationDidEnterBackground:)
//                                                 name:UIApplicationDidEnterBackgroundNotification
//                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];

}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)loginIfNecessary {
    if (!self.userLoggedIn && !self.presentingLoginController) {
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

-(void)didLogin { // LoginDelegate method called to login controller after successsful login
    NSLog(@"RootNavigationController:didLogin");
    self.presentingLoginController = NO;
    self.userLoggedIn = YES;
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"RootNavigationController:ViewDidAppear:");
    [super viewDidAppear:animated];
    [self loginIfNecessary];
}

-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"RootNavigationController:viewWillDisappear:");
}

//-(void)applicationDidEnterBackground:(NSNotification*) notification {
//    NSLog(@"RootNavigationController:applicationDidEnterBackground:");
//    // XXX self.backgroundTime = [NSDate date];
//}

-(void)applicationWillResignActive:(NSNotification*) notification {
    NSLog(@"RootNavigationController:applicationWillResignActive:");
//    self.lockImageView = [[UIImageView alloc] initWithFrame:self.view.window.frame];
//    UIImage *lockImage = [UIImage imageNamed:@"Lock"];
//    self.lockImageView.image = lockImage;
//    [self.view.window addSubview:self.lockImageView];
    self.backgroundTime = [NSDate date];
}

-(void) applicationDidBecomeActive:(NSNotification*) notification {
    NSLog(@"ViewController:applicationDidBecomeActive:");
//    if (self.lockImageView != nil) {
//        [self.lockImageView removeFromSuperview];
//        self.lockImageView = nil;
//    }
    const NSTimeInterval maxBackgroundTime = 15.0;
    if (!self.backgroundTime || [[NSDate date] timeIntervalSinceDate:self.backgroundTime] > maxBackgroundTime) {
        self.userLoggedIn = NO;
        [self loginIfNecessary];
    }
}

@end
