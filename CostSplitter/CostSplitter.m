#import <Foundation/Foundation.h>
#import "CostSplitter.h"

@implementation CostSplitter {
    NSMutableDictionary *accounts;
    //NSMutableArray *accountsArray;   //for Cost Splitter Algorithm Only
    //NSMutableArray *endPayments;
    NSInteger tribeMembersInvolved;
}

- (id) init {
    self = [super init];

    self->accounts = [[NSMutableDictionary alloc] init];
    //self->endPayments = [[NSMutableArray alloc] init];

    return self;
}

- (NSMutableArray *)splitCosts {

    self->tribeMembersInvolved = sizeof(self->accounts);
    //if (tribeMembersInvolved == 0)  ?

    NSMutableArray *accountsArray = [self convertAccountsToArray];
    NSMutableArray *endPayments = [[NSMutableArray alloc] initWithCapacity: tribeMembersInvolved];

    while ([accountsArray count] > 1) {

        [self sortBalances:accountsArray];

        NSLog(@"\nBalances:\n%@", accountsArray);

        //make these objects? Do I need to keep the name? (would remove all the index accessors [0])
        NSMutableArray *highestBalance = [accountsArray objectAtIndex:0];
        NSMutableArray *lowestBalance = [accountsArray objectAtIndex:[accountsArray count] - 1];

        NSLog(@"\nHighest Balance:\n-Name: %@\n-Balance: %@", highestBalance[0], highestBalance[1]);
        NSLog(@"\nLowest Balance:\n-Name: %@\n-Balance: %@", lowestBalance[0], lowestBalance[1]);

        NSMutableArray *settledBalance = [self makeTransaction:highestBalance:lowestBalance];

        NSLog(@"\nSettled Balance:\n-Name: %@\n-Balance: %@", settledBalance[0], settledBalance[1]);

        if (settledBalance == highestBalance) {
            [self settleDebt:endPayments:accountsArray:@"high"];
        } else {
            [self settleDebt:endPayments:accountsArray:@"low"];
        }

        NSLog(@"\nEnd Balances:\n%@", accountsArray);
        NSLog(@"\nEnd Payments:\n%@", endPayments);
        NSLog(@"----------------------------------");

    }

    NSLog(@"\nDONE");
    return endPayments;
}

- (NSMutableDictionary *)getAccounts {
    return self->accounts;
}

- (void)addAccount:(NSNumber *)userID :(NSDecimalNumber *)balance {;
    [self->accounts setObject:balance forKey:userID];
}

- (void)updateAccount:(NSNumber *)userID :(NSDecimalNumber *)newTransactionAmount {
    NSDecimalNumber *oldBalance = [accounts objectForKey:userID];
    NSDecimalNumber *newBalance = [oldBalance decimalNumberByAdding:newTransactionAmount];
    [self->accounts setObject:newBalance forKey:userID];
}


- (NSMutableArray *)sortBalances:(NSMutableArray *)accountsArray {

    [accountsArray sortUsingComparator:^(id a, id b) {
        return [b[1] compare:a[1]];
    }];

    return accountsArray;
}

//
- (NSMutableArray *)makeTransaction:(NSMutableArray *)highestBalance :(NSMutableArray *)lowestBalance {

    if (highestBalance[1] < lowestBalance[1]) {
        lowestBalance[1] = highestBalance[1] + lowestBalance[1];
        NSLog(@"\nNew Balance: \n-Name: %@\n-Balance: %@", lowestBalance[0], lowestBalance[1]);
        return highestBalance;

    } else {
        highestBalance[1] = lowestBalance[1] + highestBalance[1];
        NSLog(@"\nNew Balance: \n-Name: %@\n-Balance: %@", highestBalance[0], highestBalance[1]);
        return lowestBalance;
    }
}

- (NSMutableArray *)getLowestAbsolute:(NSMutableArray *)balance1 :(NSMutableArray *)balance2 {

    if (fabsf([balance1[1] floatValue]) < fabsf([balance2[1] floatValue])) {
        return balance1;
    } else {
        return balance2;
    }
}

- (void)settleDebt:(NSMutableArray *)endPayments :(NSMutableArray *)accountsArray :(NSString *)index {
    if ([index isEqual:(@"high")]) {
        [endPayments addObject:[NSMutableArray arrayWithObjects:accountsArray[[accountsArray count] - 1][0], accountsArray[0][1], accountsArray[0][0], nil]];
        [accountsArray removeObjectAtIndex:0];
    } else {
        accountsArray[[accountsArray count] - 1] = [self makeObjectPositive:accountsArray[[accountsArray count] - 1]];
        [endPayments addObject:[NSMutableArray arrayWithObjects:accountsArray[[accountsArray count] - 1][0], accountsArray[[accountsArray count] - 1][1], accountsArray[0][0], nil]];
        [accountsArray removeObjectAtIndex:[accountsArray count] - 1];
    }
}

- (NSObject *)makeObjectPositive:(NSObject *)balance {

    //Make positive

    return balance;
}

- (NSMutableArray *)convertAccountsToArray {

    NSMutableArray *accountsArray = [[NSMutableArray alloc] initWithCapacity:self->tribeMembersInvolved];

    for (id key in self->accounts) {
        NSLog(@"key=%@ value=%@", key, [self->accounts objectForKey:key]);
        [accountsArray addObject:[NSArray arrayWithObjects:key, [self->accounts objectForKey:key], nil]];
    }

    return accountsArray;
}


@end
