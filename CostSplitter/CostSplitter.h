#import <Foundation/Foundation.h>

@interface CostSplitter : NSObject

- (NSMutableDictionary *)getAccounts;
- (void)addAccount:(NSNumber *)userID :(NSDecimalNumber *)balance;
- (void)updateAccount:(NSNumber *)userID :(NSDecimalNumber *)newTransactionAmount;
- (NSMutableArray *)splitCosts;

@end

