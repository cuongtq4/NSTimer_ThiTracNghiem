//
//  ViewController.h
//  NSTimer_ThiTracNghiem
//
//  Created by CuongBeatbox on 3/26/15.
//  Copyright (c) 2015 CuongBeatbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *CauHoiSo;
    IBOutlet UILabel *NoiDungCauHoi;
    IBOutlet UILabel *DapAnA;
    IBOutlet UILabel *DapAnB;
    IBOutlet UILabel *DapAnC;
    IBOutlet UISegmentedControl *CauTraLoi;
    IBOutlet UILabel *KetQua;
    IBOutlet UIButton *CauTiepTheo;
    
    NSTimer *ThoiGian;
    int Diem;
    int CauHoiDangLam;
    int SoCauTraLoiSai;
    NSArray *CacCauHoi;
    NSArray *CacCauTraLoi;
    NSArray *DapAn;
}

- (IBAction)CauTraLoi:(id)sender;
- (IBAction)CauTiepTheo:(id)sender;

@end

 