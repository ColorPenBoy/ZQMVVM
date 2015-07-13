//
//  Visitor+AppDefine.h
//  ZeroGo_Tools
//
//  Created by colorful-MBP on 15/4/18.
//  Copyright (c) 2015年 colorful-MBP. All rights reserved.
//


/**
 适配宏
 */
#define ScreenMultiple  ([UIScreen mainScreen].bounds.size.width/320)

/**
 * UI常用
 */
#define NavigationBar_HEIGHT 44.0f
#define Tabbar_HEIGHT 49.0f
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


#define kRect(_x, _y, _w, _h) CGRectMake((_x), (_y), (_w), (_h))
#define ImageNamed(_name)     [UIImage imageNamed:_name]
/**
 * 获取系统版本
 */
#define iOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
#define isIOS7 [[[UIDevice currentDevice] systemVersion] floatValue]==7.0

/**
 * 在debug模式下启用DLog
 */
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#ifdef DEBUG  // 调试状态
// 打开LOG功能
#define HS_Log(...) NSLog(__VA_ARGS__)
#else // 发布状态
// 关闭LOG功能
#define HS_Log(...)
#endif

/**
 * 判断设备是iPad
 */
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/**
 * GCD
 */
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
/**
 *  由角度获取弧度
 *  由弧度获取角度
 */
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)
/**
 * 颜色，图像，NSUserDefaults
 */
#define IMAGE_NAMED(_pointer) [UIImage imageNamed:_pointer]
#define LOAD_IMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]

/**
 * 检查系统版本
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
/**
 *  中英文定义
 */
#define Language_Ch    @"zh-cn"
#define Language_En    @"en"
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
/**
 *  常用字体
 */
#define FONT_NewRoman    @"Times New Roman"          //新罗马字体
#define FONT_NewCourier  @"Courier New"              //幼圆
#define FONT_Verdana     @"Verdana"                  //Verdana类型
#define FONT_HeitiSC     @"STHeitiSC-Medium"         //黑体简
#define FONT_HNBold      @"HelveticaNeue-Bold"       //加粗
#define ShareFont        [UIFont fontWithName:@"Helvetica-Bold" size:20]
#define HeiTiFont(_size) [UIFont fontWithName:@"STHeitiSC-Medium" size:_size]
/**
 *  软件的各个属性
 */
#define IPHONE_UUID [[NSUUID UUID] UUIDString]                              //获取UUID
#define IPHONE_SCREEN_RESOLUTION [[UIScreen mainScreen] currentMode].size   //屏幕分辨率
#define IPHONE_USER_NAME [[UIDevice currentDevice] name]                    //手机别名： 用户定义的名称
#define IPHONE_SYSTEM_NAME [[UIDevice currentDevice] systemName]            //设备名称
#define IPHONE_SYSTEM_VERSION [[UIDevice currentDevice] systemVersion]      //手机系统版本
#define IPHONE_MODEL [[UIDevice currentDevice] model]                       //手机型号
#define IPHONE_LOCALIZED_MODEL [[UIDevice currentDevice] localizedModel]    //地方型号（国际化区域名称）

#define MYAPP_CURRENT_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]//当前应用名称
#define MYAPP_CURRENT_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]                             //当前应用软件版本 1.0.1
#define MYAPP_CURRENT_VERSION_NUM [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];                                       //当前应用版本号码(int类型)

//读取文件
#define MAINBUNDLE(_Resource) [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",_Resource] ofType:nil]

/**
 *  文件保存目录
 */
#define PATH_OF_DOCUMENT        [NSHomeDirectory()  stringByAppendingPathComponent:@"Documents"]
#define PATH_OF_SQL             [PATH_OF_DOCUMENT   stringByAppendingPathComponent:@"Sql"]
#define PATH_OF_VOICE           [PATH_OF_DOCUMENT   stringByAppendingPathComponent:@"Voice"]
#define PATH_OF_PHOTO           [PATH_OF_DOCUMENT   stringByAppendingPathComponent:@"Photo"]
#define PATH_OF_FILE            [PATH_OF_DOCUMENT   stringByAppendingPathComponent:@"File"]

#define PATH_OF_SQLTable        [PATH_OF_DOCUMENT   stringByAppendingPathComponent:@"SQLTable.sqlite"]
#define PATH_OF_VOICE_AMR       [PATH_OF_VOICE      stringByAppendingPathComponent:@"Voice.amr"]
#define PATH_OF_VOICE_RveAMR    [PATH_OF_VOICE      stringByAppendingPathComponent:@"RveVoice.amr"]
/**
 *  常用系统单例
 */
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kApplication        [UIApplication sharedApplication]
#define kAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kFileManager        [NSFileManager defaultManager]
#define kDocumentPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

/**
 *  自定义单例.h
 */
#define DEFINE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;
/**
 *  自定义单例.m
 */
#define DEFINE_SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

/**
 *  开启iOS7侧滑返回效果
 */
#define DEFINE_RIGHT_SLIDE \
\
if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])\
{\
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;\
}
