#import <Foundation/Foundation.h>

@interface AccountsTracker : NSObject

+(AccountsTracker *)sharedInstance;

- (void)getTransactionHistory;
- (NSMutableDictionary *)getAccounts;
- (void)addTransaction:(NSString *)userFromID :(NSString *)userToId :(NSNumber *)transactionAmount;

@end
