//
//  LoginTableViewController.h
//  LockFoo
//
//  Created by Wayne Cochran on 6/10/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginDelegate <NSObject>
-(void)didLogin;
@end

@interface LoginTableViewController : UITableViewController

@property (weak, nonatomic) id<LoginDelegate> loginDelegate;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)login:(id)sender;

@end
