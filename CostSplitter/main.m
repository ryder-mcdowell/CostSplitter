#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CostSplitter.h"

int main(int argc, char * argv[]) {

    printf("Begin\n");
    
    CostSplitter *costSplitter = [[CostSplitter alloc] init];
    
    [costSplitter addAccount:@(111111) :[NSDecimalNumber decimalNumberWithDecimal:[@(8.00) decimalValue]]];
    
    NSMutableDictionary *accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);
    
    [costSplitter addAccount:@(222222) :[NSDecimalNumber decimalNumberWithDecimal:[@(-4.00) decimalValue]]];
    
    accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);
    
    [costSplitter updateAccount:@(222222) :[NSDecimalNumber decimalNumberWithDecimal:[@(-6.00) decimalValue]]];
    
    accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);
    
    [costSplitter addAccount:@(333333) :[NSDecimalNumber decimalNumberWithDecimal:[@(2.00) decimalValue]]];
    [costSplitter addAccount:@(444444) :[NSDecimalNumber decimalNumberWithDecimal:[@(-6.00) decimalValue]]];
    [costSplitter addAccount:@(055555) :[NSDecimalNumber decimalNumberWithDecimal:[@(10.00) decimalValue]]];
    
    accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);
    
    NSMutableArray *endPayments = [costSplitter splitCosts];
    
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
