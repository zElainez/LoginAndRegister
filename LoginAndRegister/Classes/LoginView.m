//
//  LoginView.m
//  LoginAndRegister
//
//  Created by acmedcare on 2018/4/8.
//  Copyright © 2018年 acmedcare. All rights reserved.
//

#import "LoginView.h"


@interface LoginView()
{
    UIImageView *View;
    UIView *bgView;
}



@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        
        [self configUI];
      
    }
    return self;
}



-(void)configUI{
    View=[self createImageViewFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) imageName:@"LoginBackground" color:nil];
    [self addSubview:View];
    
    [self createTextFields];
    [self createButtons];
}

-(void)createTextFields{
    
    UIImageView *logoImageView=[self createImageViewFrame:CGRectMake(20, 10, 25, 25) imageName:@"yixiuLogo.png" color:nil];
    [self addSubview:logoImageView];
    

    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, frame.size.height/2-100, frame.size.width-20, 100)];
    bgView.layer.cornerRadius=3.0;
    bgView.alpha=0.7;
    bgView.backgroundColor=[UIColor whiteColor];
    [self addSubview:bgView];
    
    _accontuser=[self createTextFielfFrame:CGRectMake(60, 10, 271, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"请输入用户名" ];
    _accontuser.clearButtonMode = UITextFieldViewModeWhileEditing;
    _accontuser.textColor=[UIColor blackColor];
    _accontuser.borderStyle=UITextBorderStyleNone;
    _accontuser.backgroundColor =[UIColor clearColor];
    
    _pwd=[self createTextFielfFrame:CGRectMake(60, 60, 271, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"密码" ];
    _pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    _pwd.secureTextEntry=YES;
    
    UIImageView *userImageView=[self createImageViewFrame:CGRectMake(20, 10, 25, 25) imageName:@"ic_landing_nickname" color:nil];
    UIImageView *pwdImageView=[self createImageViewFrame:CGRectMake(20, 60, 25, 25) imageName:@"mm_normal" color:nil];
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    [bgView addSubview:_accontuser];
    [bgView addSubview:_pwd];
    
    [bgView addSubview:userImageView];
    [bgView addSubview:pwdImageView];
    [bgView addSubview:line1];

    
}


-(void)createButtons{
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, CGRectGetMaxY(bgView.frame)+20, self.frame.size.width-20, 37) backImageName:nil title:@"登录" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:19] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    UIButton *forgetBtn=[self createButtonFrame:CGRectMake(5, CGRectGetMaxY(landBtn.frame)+10, 70, 30) backImageName:nil title:@"忘记密码" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13] target:self action:@selector(fogetPwd:)];
    //newUserBtn.backgroundColor=[UIColor lightGrayColor];
    
    UIButton *validateBtn=[self createButtonFrame:CGRectMake(self.frame.size.width-75,CGRectGetMaxY(landBtn.frame)+10, 70, 30) backImageName:nil title:@"验证码登录" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:13] target:self action:@selector(validateBtnClick:)];
    
    [self addSubview:landBtn];
    [self addSubview:forgetBtn];
    [self addSubview:validateBtn];

}

//登录
-(void)landClick
{
    __weak typeof(self) weakself=self;
    if(weakself.returnValueBlock){
        weakself.returnValueBlock(_accontuser.text, _pwd.text);
    }
    
}

-(void)fogetPwd:(UIButton *)btn{
    
}

-(void)validateBtnClick:(UIButton *)btn{
    
}

-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
}

-(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    
    if (imageName)
    {
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        imageView.image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];

    }
    if (color)
    {
        imageView.backgroundColor=color;
    }
    
    return imageView;
}

-(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (imageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (font)
    {
        btn.titleLabel.font=font;
    }
    
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color)
    {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target&&action)
    {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

@end
