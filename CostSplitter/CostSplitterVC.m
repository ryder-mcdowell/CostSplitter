#import "CostSplitterVC.h"
#import "CostSplitter.h"

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
    CostSplitter *costSplitter = [CostSplitter sharedInstance];
    
    [costSplitter addAccount:[NSNumber numberWithFloat:[self.fromTextField.text floatValue]] :[NSNumber numberWithFloat:[self.amountTextField.text floatValue]]];
    NSMutableDictionary *accounts = [costSplitter getAccounts];
    NSLog(@"\n%@", accounts);
}

//tap out of keyboard functionality
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.fromTextField resignFirstResponder];
    [self.toTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
}

@end
