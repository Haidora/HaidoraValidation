//
//  UITextField+HDValidation.m
//  Pods
//
//  Created by Dailingchi on 15/7/28.
//
//

#import "UITextField+HDValidation.h"
#import <objc/runtime.h>

static char *kHD_UITextField_validators = "kHD_UITextField_validators";
static char *kHD_UITextField_validatorName = "kHD_UITextField_validatorName";

@implementation UITextField (HDValidation)

@dynamic hd_validatorName;
@dynamic hd_validators;

- (NSArray *)hd_validate
{
    return [REValidation validateObject:self.text
                                   name:self.hd_validatorName
                             validators:self.hd_validators];
}

- (NSString *)hd_validationString
{
    NSString *erroString = [NSString string];
    for (NSError *error in [self hd_validate])
    {
        erroString = [erroString stringByAppendingFormat:@"%@\n", error.localizedDescription];
    }
    return erroString;
}

#pragma mark
#pragma mark Setter /Getter

- (void)setHd_validatorName:(NSString *)hd_validatorName
{
    objc_setAssociatedObject(self, &kHD_UITextField_validatorName, hd_validatorName,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)hd_validatorName
{
    return objc_getAssociatedObject(self, &kHD_UITextField_validatorName);
}

- (NSArray *)hd_validators
{
    return objc_getAssociatedObject(self, &kHD_UITextField_validators);
}

- (void)setHd_validators:(NSArray *)hd_validators
{
    objc_setAssociatedObject(self, &kHD_UITextField_validators, hd_validators,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@interface NSObject (HDValidation)

@end

@implementation NSObject (HDValidation)

+ (void)load
{
    [REValidation registerDefaultValidators];
    [REValidation registerDefaultErrorMessages];
}

@end
