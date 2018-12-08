//
//  NSDate+ZZQExtension.h
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TIME_MINUTE       60
#define TIME_HOUR           3600
#define TIME_DAY              86400
#define TIME_WEEK           604800
#define TIME_YEAR            31556926

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZZQExtension)
// 每周是从星期一 开始
+ (NSCalendar *)currentCalendar;

+ (NSDate *)dateTomorrow;
+ (NSDate *)dateYesterday;
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)dateWithHoursFromNow:(NSInteger)hours;
+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)hours;
+ (NSDate *)dateWithMinutesFromNow:(NSInteger)minutes;
+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)minutes;
+ (NSDate *)dateWithDateString:(NSString *)dateString formatter:(NSString *)formatter;


- (NSString *)stringWithDateFormatter:(NSString *)formatter;

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)date;

- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;


- (BOOL)isSameWeekAsDate:(NSDate *)date;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;


- (BOOL)isSameMonthAsDate:(NSDate *)date;
- (BOOL)isThisMonth;
- (BOOL)isNextMonth;
- (BOOL)isLastMonth;


- (BOOL)isSameYearAsDate:(NSDate *)date;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;


- (BOOL)isEarlierThanDate:(NSDate *)date;
- (BOOL)isEarlierOrSameDate:(NSDate *)date;

- (BOOL)isLaterThanDate:(NSDate *)date;
- (BOOL)isLaterOrSameDate:(NSDate *)date;


- (NSDate *)dateAtStartOfDay;
- (NSDate *)dateAtEndOfDay;

- (NSDate *)dateAtMondayOfThisWeek;
- (NSDate *)dateAtSundayOfThisWeek;


- (NSDate *)dateByAddingYears: (NSInteger)years;
- (NSDate *)dateBySubtractingYears: (NSInteger)years;
- (NSDate *)dateByAddingMonths: (NSInteger)months;
- (NSDate *)dateBySubtractingMonths: (NSInteger)months;
- (NSDate *)dateByAddingDays: (NSInteger)days;
- (NSDate *)dateBySubtractingDays: (NSInteger)days;
- (NSDate *)dateByAddingHours: (NSInteger)hours;
- (NSDate *)dateBySubtractingHours: (NSInteger)hours;
- (NSDate *)dateByAddingMinutes: (NSInteger)minutes;
- (NSDate *)dateBySubtractingMinutes: (NSInteger)minutes;


- (NSDate *)dateWithFormat:(NSString *)format;


@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger second;


@end

NS_ASSUME_NONNULL_END
