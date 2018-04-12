#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "CostSplitter.h"

int main(int argc, char * argv[]) {

    printf("Begin\n");

    CostSplitter *costSplitter = [[CostSplitter alloc] init];

    [costSplitter addAccount:@(111111) :[NSNumber numberWithFloat:[@(8.00) floatValue]]];

    NSMutableDictionary *accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);

    [costSplitter addAccount:@(222222) :[NSNumber numberWithFloat:[@(-2.00) floatValue]]];

    accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);

    [costSplitter updateAccount:@(222222) :[NSNumber numberWithFloat:[@(-2.00) floatValue]]];

    accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);

    [costSplitter addAccount:@(333333) :[NSNumber numberWithFloat:[@(7.00) floatValue]]];
    [costSplitter addAccount:@(444444) :[NSNumber numberWithFloat:[@(-6.00) floatValue]]];
    [costSplitter addAccount:@(055555) :[NSNumber numberWithFloat:[@(3.00) floatValue]]];
    [costSplitter addAccount:@(155555) :[NSNumber numberWithFloat:[@(-3.00) floatValue]]];
    [costSplitter addAccount:@(255555) :[NSNumber numberWithFloat:[@(-5.00) floatValue]]];

    accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);

    NSMutableArray *endPayments = [costSplitter splitCosts];


    
    
    //objtrips.user_id = [CommonFunctions getUserID];

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
