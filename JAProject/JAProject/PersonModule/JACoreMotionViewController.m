//
//  JACoreMotionViewController.m
//  JAProject
//
//  Created by xiazhongchong on 2018/4/2.
//  Copyright © 2018 esunny. All rights reserved.
//

#import "JACoreMotionViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface JACoreMotionViewController ()

@property (nonatomic, strong) CMMotionManager *manager;
@property (nonatomic, strong) CMPedometer *pedometer;

@end

@implementation JACoreMotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    if (self.manager.accelerometerAvailable) {
//        self.manager.accelerometerUpdateInterval = 1;
//    } else {
//        NSLog(@"加速计不可用");
//    }
//    if (self.manager.accelerometerActive) {
//        
//    } else {
//        NSLog(@"加速计是否处于活跃状态");
//    }
//    [self.manager startAccelerometerUpdates];
////    _manager.accelerometerData.acceleration.x
////    [_manager stopAccelerometerUpdates];
//    
//    if (_manager.gyroAvailable) {
//        _manager.gyroUpdateInterval = 1.0;
//    } else {
//        NSLog(@"陀螺仪不可用");
//    }
//    if (_manager.gyroActive) {
//        
//    } else {
//        
//    }
//    [_manager startGyroUpdates];
////    _manager.gyroData.rotationRate.x
////    [_manager stopGyroUpdates];
//    
//    if (_manager.magnetometerAvailable) {
//        _manager.magnetometerUpdateInterval = 1.0f;
//    } else {
//        NSLog(@"磁力计不可用");
//    }
//    
//    if (_manager.magnetometerActive) {
//        
//    } else {
//        
//    }
//    [_manager startMagnetometerUpdates];
////    _manager.magnetometerData.magneticField.x
//    [_manager stopMagnetometerUpdates];
//    
//    if (_manager.deviceMotionAvailable) {
//        _manager.deviceMotionUpdateInterval = 1.0f;
//    } else {
//        
//    }
//    _manager.showsDeviceMovementDisplay = YES;
//    
//    if ([CMPedometer isStepCountingAvailable]) {
//        
//    }
//    
//    if ([CMPedometer isDistanceAvailable]) {
//        
//    }
//    
//    if ([CMPedometer isCadenceAvailable]) {
//        
//    }
//    
//    if ([CMPedometer isFloorCountingAvailable]) {
//        
//    }
//    
//    if ([CMPedometer isPedometerEventTrackingAvailable]) {
//        
//    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 64, self.view.width - 80, self.view.height)];
    label.numberOfLines = 0;
    label.font = kFont;
    label.tag = 200;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *startDate = [calendar dateFromComponents:components];
    NSDate *endDate = [NSDate date];
    [self.pedometer queryPedometerDataFromDate:startDate toDate:endDate withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
        label.text = [NSString stringWithFormat:@" steps:%ld\n distance:%.0f\n currentPace:%.2f\n currentCadence:%.2f\n averagePace:%.2f\n floorA:%@\n floorD:%@\n", [pedometerData.numberOfSteps integerValue], [pedometerData.distance floatValue], [pedometerData.currentPace floatValue], [pedometerData.currentCadence floatValue], [pedometerData.averageActivePace floatValue], pedometerData.floorsAscended, pedometerData.floorsDescended];

        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CMPedometer *)pedometer {
    if (!_pedometer) {
        _pedometer = [[CMPedometer alloc] init];
    }
    return _pedometer;
}

- (CMMotionManager *)manager {
    if (!_manager) {
        _manager = [[CMMotionManager alloc] init];
    }
    return _manager;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
