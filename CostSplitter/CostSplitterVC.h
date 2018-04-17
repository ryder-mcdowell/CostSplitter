#import <UIKit/UIKit.h>

@interface CostSplitterVC : UIViewController {
    IBOutlet UITableView *transactionsTable;
    
}
@property (strong, nonatomic) IBOutlet UITextField *fromTextField;
@property (strong, nonatomic) IBOutlet UITextField *toTextField;
@property (strong, nonatomic) IBOutlet UITextField *amountTextField;
@property (strong, nonatomic) IBOutlet UIButton *addTransactionButton;



@end


