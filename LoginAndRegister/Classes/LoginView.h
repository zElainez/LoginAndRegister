//
//  LoginView.h
//  LoginAndRegister
//
//  Created by acmedcare on 2018/4/8.
//  Copyright © 2018年 acmedcare. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnValueBlock) (NSString *accountStr,NSString *pwdStr);

@interface LoginView : UIView

@property(nonatomic,strong)UITextField *accontuser;
@property(nonatomic,strong)UITextField *pwd;

@property(nonatomic,copy)ReturnValueBlock returnValueBlock;




@end
