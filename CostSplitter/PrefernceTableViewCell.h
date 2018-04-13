//
//  PrefernceTableViewCell.h
//  FindIt
//
//  Created by Ashandeep on 29/07/15.
//  Copyright (c) 2015 SilstoneGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrefernceTableViewCell : UITableViewCell

@property(nonatomic,strong)IBOutlet UIButton *btnTick,*btnAccept,*btnReject;

@property(nonatomic,strong)IBOutlet UISwitch *btnSwitch;

@property(nonatomic,strong)IBOutlet UILabel *lblPrefName, *lblimgName,*lblLocation,*lblDate,*lblsubTitle, *votingMembers;

@property(nonatomic,strong)IBOutlet UITextView *txtPrefDesc;

@property(nonatomic,strong)IBOutlet UIImageView *imgMain,*imgTrip;

@property(nonatomic,strong)IBOutlet UIButton *assignBtn;
@property(nonatomic,strong)IBOutlet UIButton *locationBtnClick;

@property(nonatomic,strong)IBOutlet UIButton *tripDescBtnClick;

@property(nonatomic,strong)IBOutlet UIImageView *itemImage;

@property(nonatomic,strong)IBOutlet UIImageView *TribeImage;

@property(nonatomic,strong)IBOutlet UIButton *itemDelete;
@property(nonatomic,strong)IBOutlet UIButton *profileBtn;
@property(nonatomic,strong)IBOutlet UIButton *votingBtn;
@property(nonatomic,strong)IBOutlet UIButton *editDatesBtn;



@end
