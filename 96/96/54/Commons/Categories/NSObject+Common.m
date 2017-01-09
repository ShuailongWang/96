//
//  NSObject+Common.m
//

#import "NSObject+Common.h"

@implementation NSObject (Common)

//显示成功信息
+ (void)showSuccessMsg:(NSString *)success {
    MBProgressHUD *hud = [self createCustomeHud];
    hud.labelText = success;
    [hud hide:YES afterDelay:1];
}
//显示失败信息
+ (void)showErrorMsg:(NSString *)error {
    MBProgressHUD *hud = [self createCustomeHud];
    hud.labelText = error;
    [hud hide:YES afterDelay:1];
}

//创建MBProgressHUD
+ (MBProgressHUD *)createCustomeHud {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:window];
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:16];
    hud.mode = MBProgressHUDModeCustomView;
    [window addSubview:hud];
    [hud show:YES];
    
    return hud;
}






@end
