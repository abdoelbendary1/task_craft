import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TasksLoadingShimmer extends StatelessWidget {
 

  const TasksLoadingShimmer({
    super.key,
 
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // إعداد ألوان الـ Shimmer المتوافقة مع الـ Dark & Light Mode
    final baseColor = theme.brightness == Brightness.dark ? Colors.grey[800]! : Colors.grey[300]!;
    final highlightColor = theme.brightness == Brightness.dark ? Colors.grey[700]! : Colors.grey[100]!;

    // بناء الكارت الهيكلي المطابق للكارت الأصلي بالتفصيل
     return Card(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        child: Padding(
          // محاكاة نفس الـ padding الداخلي للكارت الأصلي
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          child: Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            child: Row(
              children: [
                // 🔘 هيكل الـ Checkbox الدائري
                Container(
                  width: 24.w, // مقاس تقريبي متناسق مع الـ Checkbox الافتراضي
                  height: 24.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 14.w),
                
                // 📝 هيكل نصوص المهمة (العنوان والوصف)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // هيكل العنوان (Title Line)
                      Container(
                        width: 140.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      SizedBox(height: 6.h), // مساحة مرنة تناسب الخطين
                      
                      // هيكل الوصف (Description Line)
                      Container(
                        width: 200.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // 🏷️ هيكل مؤشر الأهمية (Priority Badge)
                Container(
                  width: 50.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
   

   
  }
}