#import "CostSplitterVC.h"
#import "CostSplitter.h"
#import "AccountsTracker.h"

@interface CostSplitterVC ()

@end

@implementation CostSplitterVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)addTransactionButtonClick:(id)sender {
    AccountsTracker *accountsTracker = [AccountsTracker sharedInstance];
    
    //[accountsTracker addTransaction:self.fromTextField.text :self.toTextField.text :[NSNumber numberWithFloat:[self.amountTextField.text floatValue]]];
}

//tap out of keyboard functionality
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.fromTextField resignFirstResponder];
    [self.toTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
}

@end
