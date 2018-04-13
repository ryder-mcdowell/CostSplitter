#import <Foundation/Foundation.h>

@interface AccountsTracker : NSObject

+(AccountsTracker *)sharedInstance;

- (void)getTransactionHistory:(void (^)(NSString *, NSError *))completion;
- (NSMutableDictionary *)getAccounts;
- (void)addTransaction:(void (^)(NSString *, NSError *))completion;

@end
