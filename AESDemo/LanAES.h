//
//  LanAES.h
//  智慧社区
//
//  Created by gallon on 2017/11/29.
//  Copyright © 2017年 zhsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LanAES : NSObject

+(NSData *)AES256ParmEncryptWithKey:(NSString *)key Encrypttext:(NSData *)text;   //加密
+(NSData *)AES256ParmDecryptWithKey:(NSString *)key Decrypttext:(NSData *)text;   //解密
+(NSString *) aes256_encrypt:(NSString *)key Encrypttext:(NSString *)text;
+(NSString *) aes256_decrypt:(NSString *)key Decrypttext:(NSString *)text;


@end
