#import <Foundation/Foundation.h>
#import "CostSplitter.h"

@implementation CostSplitter {
    NSMutableDictionary *accounts;
    NSMutableArray *endPayments;
}

- (id) init {
    self = [super init];
    
    self->accounts = [[NSMutableDictionary alloc] init];
    self->endPayments = [[NSMutableArray alloc] init];
    
    return self;
}

//need to update for new member variables
- (NSMutableArray *)splitCosts:(NSMutableArray *)accounts {
    
    NSInteger tribeMembersInvolved = sizeof(self->accounts);
    //if (tribeMembersInvolved == 0)  ?
    
    NSMutableArray *endPayments = [[NSMutableArray alloc] initWithCapacity: tribeMembersInvolved];
    
    while ([accounts count] > 1) {
        
        [self sortBalances:accounts];
        
        NSLog(@"\nBalances:\n%@", accounts);
        
        //make these objects? Do I need to keep the name? (would remove all the index accessors [0])
        NSMutableArray *highestBalance = [accounts objectAtIndex:0];
        NSMutableArray *lowestBalance = [accounts objectAtIndex:[accounts count] - 1];
        
        NSLog(@"\nHighest Balance:\n-Name: %@\n-Balance: %@", highestBalance[0], highestBalance[1]);
        NSLog(@"\nLowest Balance:\n-Name: %@\n-Balance: %@", lowestBalance[0], lowestBalance[1]);
        
        NSMutableArray *settledBalance = [self makeTransaction:highestBalance:lowestBalance];
        
        NSLog(@"\nSettled Balance:\n-Name: %@\n-Balance: %@", settledBalance[0], settledBalance[1]);
        
        if (settledBalance == highestBalance) {
            [self settleDebt:endPayments:accounts:@"high"];
        } else {
            [self settleDebt:endPayments:accounts:@"low"];
        }
        
        NSLog(@"\nEnd Balances:\n%@", accounts);
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


- (NSMutableArray *)sortBalances:(NSMutableArray *)accounts {
    
    [accounts sortUsingComparator:^(id a, id b) {
        return [b[1] compare:a[1]];
    }];
    
    return accounts;
}

- (NSMutableArray *)makeTransaction:(NSMutableArray *)highestBalance :(NSMutableArray *)lowestBalance {
    
    if (fabsf([highestBalance[1] floatValue]) < fabsf([lowestBalance[1] floatValue])) {
        lowestBalance[1] = [NSNumber numberWithFloat:([highestBalance[1] floatValue] + [lowestBalance[1] floatValue])];
        NSLog(@"\nNew Balance: \n-Name: %@\n-Balance: %@", lowestBalance[0], lowestBalance[1]);
        return highestBalance;
        
    } else {
        highestBalance[1] = [NSNumber numberWithFloat:([lowestBalance[1] floatValue] + [highestBalance[1] floatValue])];
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

- (void)settleDebt:(NSMutableArray *)endPayments :(NSMutableArray *)accounts :(NSString *)index {
    if ([index isEqual:(@"high")]) {
        [endPayments addObject:[NSMutableArray arrayWithObjects:accounts[[accounts count] - 1][0], accounts[0][1], accounts[0][0], nil]];
        [accounts removeObjectAtIndex:0];
    } else {
        accounts[[accounts count] - 1] = [self makeObjectPositive:accounts[[accounts count] - 1]];
        [endPayments addObject:[NSMutableArray arrayWithObjects:accounts[[accounts count] - 1][0], accounts[[accounts count] - 1][1], accounts[0][0], nil]];
        [accounts removeObjectAtIndex:[accounts count] - 1];
    }
}

- (NSObject *)makeObjectPositive:(NSObject *)balance {
    
    //Make positive
    
    return balance;
}


@end
