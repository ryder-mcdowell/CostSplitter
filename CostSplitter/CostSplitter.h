#import <Foundation/Foundation.h>

@interface CostSplitter : NSObject

+(CostSplitter *)sharedInstance;

- (NSMutableDictionary *)getAccounts;
- (void)addAccount:(NSNumber *)userID :(NSNumber *)balance;
- (void)updateAccount:(NSNumber *)userID :(NSNumber *)newTransactionAmount;
- (NSMutableArray *)splitCosts;

@end

