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

@property (assign, nonatomic) BOOL viewHasAppeared;
@property (assign, nonatomic) BOOL presentingLoginController;

-(void) applicationDidBecomeActive:(NSNotification*) notification;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewControll:viewDidLoad");
    self.viewHasAppeared = NO;
    self.presentingLoginController = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
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
    self.viewHasAppeared = YES;
    [self loginIfNecessary];
}

-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"ViewController:viewWillDisappear:");
}

-(void) applicationDidBecomeActive:(NSNotification*) notification {
    NSLog(@"ViewController:applicationDidBecomeActive:");
    //XXX if (self.viewHasAppeared) {  // avoid login before view has appeared (handled by viewDidAppear in this case).
        [self loginIfNecessary];
    //XXX}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
