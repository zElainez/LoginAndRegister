//
//  LoginViewController.m
//  LoginAndRegister
//
//  Created by acmedcare on 2018/4/8.
//  Copyright © 2018年 acmedcare. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "ACNetworkHelper.h"


@interface LoginViewController ()

@property(nonatomic,strong)LoginView *loginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self congfigLoginUI];
    
}

-(void)congfigLoginUI{
    _loginView=[[LoginView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _loginView.returnValueBlock = ^(NSString *accountStr, NSString *pwdStr) {
        NSLog(@"----------%@,%@",accountStr,pwdStr);
        
        [ACNetworkHelper GET:@"http://121.42.153.1:8080/imservice/v1/doctorChat/getUserInfo/1187cc2ca4a94a9693e5b022c5a99ff9" userToken:@"ZTEwYWRjMzk0OWJhNTlhYmJlNTZlMDU3ZjIwZjg4MzoxMTg3Y2MyY2E0YTk0YTk2OTNlNWIwMjJjNWE5OWZmOToxNTIzNDI4MDIxOTMwOjE0" parameters:nil success:^(id responseObject) {
            NSLog(@"----%@",responseObject);
        } failure:^(NSError *error) {

        }];

    };
    [self.view addSubview:_loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
