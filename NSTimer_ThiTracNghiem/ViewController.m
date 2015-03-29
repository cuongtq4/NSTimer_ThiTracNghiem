//
//  ViewController.m
//  NSTimer_ThiTracNghiem
//
//  Created by CuongBeatbox on 3/26/15.
//  Copyright (c) 2015 CuongBeatbox. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Diem = 0;
    CauHoiDangLam = 0;
    SoCauTraLoiSai = 0;
    CacCauHoi = [NSArray arrayWithObjects:
                 @"Question 1",
                 @"Question 2",
                 @"Question 3",
                 @"Question 4",
                 @"Question 5",nil];
    CacCauTraLoi = [NSArray arrayWithObjects:
                    @"dap an sai-dap an dung-dap an sai",
                    @"dap an dung-dap an sai-dap an sai",
                    @"dap an dung-dap an sai-dap an sai",
                    @"dap an sai-dap an sai-dap an dung",
                    @"dap an sai-dap an sai-dap an dung",nil];
    DapAn = [NSArray arrayWithObjects:
             @"1",
             @"0",
             @"0",
             @"2",
             @"2",nil];
    
    ThoiGian = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ThucThi) userInfo:nil repeats:YES];
    [CauHoiSo setText:[NSString stringWithFormat:@"Câu hỏi số: %i",CauHoiDangLam + 1]];
    [NoiDungCauHoi setText:[CacCauHoi objectAtIndex:CauHoiDangLam]];
    NSArray *CacDapAn = [[CacCauTraLoi objectAtIndex:CauHoiDangLam] componentsSeparatedByString:@"-"];
    [DapAnA setText:[NSString stringWithFormat:@"Dap An A: %@", [CacDapAn objectAtIndex:0]]];
    [DapAnB setText:[NSString stringWithFormat:@"Dap An B: %@", [CacDapAn objectAtIndex:1]]];
    [DapAnC setText:[NSString stringWithFormat:@"Dap An C: %@", [CacDapAn objectAtIndex:2]]];
    
}

- (void)ThucThi {
    static int i = 0;
    NSLog(@"%i", i);
    i++;
    if(i == 30) {
        [ThoiGian invalidate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CauTraLoi:(id)sender {
    NSInteger DapAnTuNguoiDung = [CauTraLoi selectedSegmentIndex];
    NSInteger DapAnChinhThuc = [[DapAn objectAtIndex:CauHoiDangLam] intValue];
    if (DapAnTuNguoiDung == DapAnChinhThuc) {
        //Log
        Diem = Diem + 1;
        [KetQua setText:@"Chinh Xac"];
    } else {
        SoCauTraLoiSai += 1;
        [KetQua setText:@"Sai Cmnr!"];
    }
}
- (IBAction)CauTiepTheo:(id)sender {
    if (CauHoiDangLam == 3) {
        [CauTiepTheo setTitle:@"Ket Qua" forState:UIControlStateNormal];
    }
    if (CauHoiDangLam == 4) {
        //Xuat diem
        NSLog(@"Diem cua ban la: %i", Diem);
        NSLog(@"Ban tra loi dung %i/5 cau hoi", 5 - SoCauTraLoiSai);
        [CauTiepTheo setEnabled:NO];
        [NoiDungCauHoi setText:[NSString stringWithFormat:@"Ban da tra loi dung %i cau tren tong so 5 cau.", 5 - SoCauTraLoiSai]];
        
    } else {
        [KetQua setText:@""];
        [CauTraLoi setSelectedSegmentIndex:-1];
        CauHoiDangLam = CauHoiDangLam + 1;
        [CauHoiSo setText:[NSString stringWithFormat:@"Câu hỏi số: %i",CauHoiDangLam + 1]];
        [NoiDungCauHoi setText:[CacCauHoi objectAtIndex:CauHoiDangLam]];
        NSArray *CacDapAn = [[CacCauTraLoi objectAtIndex:CauHoiDangLam] componentsSeparatedByString:@"-"];
        [DapAnA setText:[NSString stringWithFormat:@"Dap An A: %@", [CacDapAn objectAtIndex:0]]];
        [DapAnB setText:[NSString stringWithFormat:@"Dap An B: %@", [CacDapAn objectAtIndex:1]]];
        [DapAnC setText:[NSString stringWithFormat:@"Dap An C: %@", [CacDapAn objectAtIndex:2]]];
    }
}
@end
