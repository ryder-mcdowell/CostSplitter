#import <XCTest/XCTest.h>
#import "AccountsTracker.h"

@interface AccountsTrackerTests : XCTestCase

@end

@implementation AccountsTrackerTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCanGetTransactionHistory {
    AccountsTracker *accountsTracker = [[AccountsTracker alloc] init];
    NSMutableArray *transactionHistory = [accountsTracker getTransactionHistory];
    transactionHistory = nil;
}

- (void)testCanGetAccounts {
    AccountsTracker *accountsTracker = [[AccountsTracker alloc] init];
    NSMutableDictionary *accounts = [accountsTracker getAccounts];
    accounts = nil;
}

- (void)testCanAddTransactionToTransactionHistory {
    AccountsTracker *accountsTracker = [[AccountsTracker alloc] init];
    NSString *userFromId = @"00000";
    NSString *userToId = @"11111";
    NSNumber *amount = @(100.0);
    
    [accountsTracker addTransaction:userFromId:userToId:amount];
    
    NSMutableArray *history = [accountsTracker getTransactionHistory];
    
    //XCTAssertEqual(userFromId, history[0].from);
    //XCTAssertEqual(userToId, history[0].to);
    //XCTAssertEqual(amount, history[0].amount);
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
