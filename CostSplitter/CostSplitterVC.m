#import "CostSplitterVC.h"
#import "CostSplitter.h"
#import "AccountsTracker.h"
#import "SBJsonParser.h"
#import "PrefernceTableViewCell.h"


@interface CostSplitterVC () {
    NSMutableArray *transactionHistory;
}

@end

@implementation CostSplitterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self->transactionHistory = [[NSMutableArray alloc] init];
    [self getTransactionHistory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self->transactionHistory.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PrefernceTableViewCell *cell = nil;
    static NSString *cellIdentifier = @"transactionCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[PrefernceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    NSDictionary *transactionData = [transactionHistory objectAtIndex:indexPath.row];
    
    NSLog(@"\nTransactionData:\n%@", transactionData);
    
    cell.lblPrefName.text = [NSString stringWithFormat:@"%@ paid %@ %@", transactionData[@"userFromId"], transactionData[@"userToId"], transactionData[@"amount"]];
    
    return cell;
}

- (void)getTransactionHistory {
    AccountsTracker *accountsTracker = [AccountsTracker sharedInstance];
    
    [accountsTracker getTransactionHistory:^(NSString *result, NSError *err) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            SBJsonParser *jsonParser=[[SBJsonParser alloc] init];
            
            NSMutableArray *parsedData = [jsonParser objectWithString:result error:nil];
        
            self->transactionHistory = parsedData;
            [transactionsTable reloadData];
            
        });
    }];
}

- (IBAction)addTransactionButtonClick:(id)sender {
    AccountsTracker *accountsTracker = [AccountsTracker sharedInstance];
    
    [accountsTracker addTransaction:^(NSString *result, NSError *err) {
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            
            NSMutableDictionary *parsedData = [jsonParser objectWithString:result error:nil];
            NSLog(@"\nParsed Data:\n%@", parsedData);
            
            //if ([parsedData[@"Message"] isEqualToString:@"Success"]) {
            //    [self getTransactionHistory];
            //}
        });
    }];
}

//tap out of keyboard functionality
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.fromTextField resignFirstResponder];
    [self.toTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
}

@end
