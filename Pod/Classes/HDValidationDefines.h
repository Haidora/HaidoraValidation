//
//  HDValidationDefines.h
//  Pods
//
//  Created by Dailingchi on 15/7/28.
//
//

#ifndef Pods_HDValidationDefines_h
#define Pods_HDValidationDefines_h

#import <Foundation/Foundation.h>
#import <REValidation/REValidation.h>

@protocol HDValidation <NSObject>

@required

/**
 *  验证对象的名称
 */
@property (nonatomic, copy) NSString *hd_validatorName;

/**
 *  验证器集合
 */
@property (nonatomic, strong) IBOutletCollection(REValidator) NSArray *hd_validators;

/**
 *  验证
 *
 *  @return NSError的集合
 */
- (NSArray *)hd_validate;
- (NSString *)hd_validationString;

@end

#endif
