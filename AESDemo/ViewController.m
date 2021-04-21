//
//  ViewController.m
//  AESDemo
//
//  Created by gallon on 2019/10/18.
//  Copyright © 2019年 gallon. All rights reserved.
//

#import "ViewController.h"
#import "LanAES.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong,nonatomic) UITextField*inputTF;
@property (strong,nonatomic) UILabel*answerLabel;
@property (strong,nonatomic) NSString*result;
@property (strong,nonatomic) UIButton*t1Btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.answerLabel];
    [self.view addSubview:self.inputTF];
    _result=@"";
    [self.view addSubview:self.t1Btn];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchT1Btn{
    [_inputTF resignFirstResponder];
    self.result=[LanAES aes256_decrypt:@"" Decrypttext:self.inputTF.text];
    _answerLabel.text=self.result;
}
-(UITextField*)inputTF{
    if (!_inputTF) {
        _inputTF=[[UITextField alloc]initWithFrame:CGRectMake(30, 80, self.view.bounds.size.width-60, 40)];
        _inputTF.clearButtonMode=UITextFieldViewModeWhileEditing;
        _inputTF.placeholder=@"请在此输入需要转换的字符串";
        _inputTF.delegate=self;
        _inputTF.borderStyle=UITextBorderStyleRoundedRect;
        _inputTF.layer.borderColor=[UIColor darkGrayColor].CGColor;
        _inputTF.layer.cornerRadius=5.0f;
        _inputTF.backgroundColor=[UIColor whiteColor];
        _inputTF.font=[UIFont systemFontOfSize:15];
        _inputTF.textColor=[UIColor blackColor];
    }return _inputTF;
}
-(UILabel*)answerLabel{
    
    if (!_answerLabel) {
        _answerLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 150,self.view.bounds.size.width-60, 40)];
        _answerLabel.font=[UIFont systemFontOfSize:15];
        _answerLabel.textColor=[UIColor redColor];
        _answerLabel.layer.cornerRadius=5.0f;
        _answerLabel.backgroundColor=[UIColor whiteColor];
        _answerLabel.layer.borderWidth=0.5;
        _answerLabel.layer.borderColor=[UIColor darkGrayColor].CGColor;
    }
    return _answerLabel;
}

-(UIButton*)t1Btn{
    if (!_t1Btn) {
        _t1Btn=[[UIButton alloc]initWithFrame:CGRectMake(30, 210, 60, 50)];
        [_t1Btn setTitle:@"解密" forState:UIControlStateNormal];
        [_t1Btn addTarget:self action:@selector(touchT1Btn) forControlEvents:UIControlEventTouchUpInside];
        [_t1Btn setTintColor:[UIColor whiteColor]];
        _t1Btn.backgroundColor=[UIColor redColor];
        _t1Btn.titleLabel.font=[UIFont systemFontOfSize:15];
    }
    return _t1Btn;
}
@end
