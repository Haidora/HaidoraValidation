//
//  UITextView+HDValidation.m
//  Pods
//
//  Created by Dailingchi on 15/7/28.
//
//

#import "UITextView+HDValidation.h"
#import <objc/runtime.h>

static char *kHD_UITextView_validators = "kHD_UITextView_validators";
static char *kHD_UITextView_validatorName = "kHD_UITextView_validatorName";

@implementation UITextView (HDValidation)

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
    objc_setAssociatedObject(self, &kHD_UITextView_validatorName, hd_validatorName,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)hd_validatorName
{
    return objc_getAssociatedObject(self, &kHD_UITextView_validatorName);
}

- (NSArray *)hd_validators
{
    return objc_getAssociatedObject(self, &kHD_UITextView_validators);
}

- (void)setHd_validators:(NSArray *)hd_validators
{
    objc_setAssociatedObject(self, &kHD_UITextView_validators, hd_validators,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end