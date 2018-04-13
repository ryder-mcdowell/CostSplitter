#import <Foundation/Foundation.h>
#import "AccountsTracker.h"

@implementation AccountsTracker {
    NSMutableArray *transactionHistory;
    NSMutableDictionary *accounts;
}

static AccountsTracker *instance;

+(AccountsTracker *)sharedInstance {
    @synchronized(self) {
        if (nil == instance) {
            instance = [[self alloc] init];
        }
    }
    return instance;
}

- (void)getTransactionHistory:(void (^)(NSString *, NSError *))completion {
    
    __block NSString *respCompData = nil;   // Response Completion Data?
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://5acffb3a4e5b600014a10304.mockapi.io/transactions"]];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        respCompData = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        if((long)[httpResponse statusCode]==200) {
            NSLog(@"Success");
        } else {
            NSLog(@"Fail");
        }
        
        completion(respCompData, nil);
        
    }] resume];
    
}

- (NSMutableDictionary *)getAccounts {
    return self->accounts;
}

- (void)addTransaction:(void (^)(NSString *, NSError *))completion {
    
    __block NSString *respCompData = nil;    // ?
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://5acffb3a4e5b600014a10304.mockapi.io/transactions"]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSString *stringData = [NSString stringWithFormat:@""];
    
    NSData *requestBodyData = [stringData dataUsingEncoding:NSUTF8StringEncoding];

    [request setHTTPBody:requestBodyData];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        respCompData = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];

        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        if((long)[httpResponse statusCode]==201) {
            NSLog(@"Success");
        } else {
            NSLog(@"Fail");
        }
        
        completion(respCompData, nil);
        
    }] resume];
}



@end
