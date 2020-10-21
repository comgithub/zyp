//
//  CommonlyUsedMethod.m
//  zyp
//
//  Created by 张伊朋 on 2020/10/20.
//

#import "CommonlyUsedMethod.h"

@implementation CommonlyUsedMethod


/*GCD定时器*/
/*
-(void)createDispatch_source_t{
    //创建全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //使用全局队列创建计时器
    _sourceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //定时器延迟时间
    NSTimeInterval delayTime = 1.0f;
    //定时器间隔时间
    NSTimeInterval timeInterval = 1.0f;
    //设置开始时间
    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    //设置计时器
    dispatch_source_set_timer(_sourceTimer,startDelayTime,timeInterval*NSEC_PER_SEC,0.1*NSEC_PER_SEC);
    //执行事件
    dispatch_source_set_event_handler(_sourceTimer,^{
        //销毁定时器
        dispatch_source_cancel(self->_sourceTimer);
        dispatch_async(dispatch_get_main_queue(),^{
            [MBProgressHUD hideHUDForView:self.view animated:NO];
        });
    });
    
    //启动计时器
    dispatch_resume(_sourceTimer);
}*/
@end
