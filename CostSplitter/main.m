#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CostSplitter.h"

int main(int argc, char * argv[]) {

    printf("Begin\n");
    
    //NSMutableArray *accounts = [[NSMutableArray alloc] initWithCapacity: 7];
    
    
    //[accounts addObject:[NSMutableArray arrayWithObjects:@"Alice", @(8), nil]];
    //[accounts addObject:[NSMutableArray arrayWithObjects:@"Bob", @(-4), nil]];
    //[accounts addObject:[NSMutableArray arrayWithObjects:@"Charlie", @(-5), nil]];
    //[accounts addObject:[NSMutableArray arrayWithObjects:@"David", @(7), nil]];
    //[accounts addObject:[NSMutableArray arrayWithObjects:@"Eve", @(-6), nil]];
    //[accounts addObject:[NSMutableArray arrayWithObjects:@"Filip", @(3), nil]];
    //[accounts addObject:[NSMutableArray arrayWithObjects:@"Gary", @(-3), nil]];
    
    
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
    
    
    
    //NSMutableArray *endPayments = [costSplitter splitCosts:accounts];
    
    
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
