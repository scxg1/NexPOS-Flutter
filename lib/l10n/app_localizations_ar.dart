// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'نكست بوس';

  @override
  String get scannedItems => 'المنتجات الممسوحة';

  @override
  String itemsTotal(int count) {
    return '$count عنصر';
  }

  @override
  String get reviewOrder => 'مراجعة الطلب';

  @override
  String get checkout => 'الدفع';

  @override
  String get grandTotal => 'المجموع الكلي';

  @override
  String get totalPrice => 'السعر الإجمالي';

  @override
  String get printReceipt => 'طباعة الفاتورة';

  @override
  String get scanToPay => 'امسح للدفع';

  @override
  String get settings => 'الإعدادات';

  @override
  String get products => 'المنتجات';

  @override
  String get manageStockBarcodes => 'إدارة المخزون والبار كود';

  @override
  String get shopDetails => 'تفاصيل المتجر';

  @override
  String get editBusinessInfo => 'تعديل بيانات النشاط والعنوان';

  @override
  String get management => 'الإدارة';

  @override
  String get hardware => 'الأجهزة';

  @override
  String get printDevice => 'جهاز الطباعة';

  @override
  String get noPrinterConnected => 'لا يوجد طابعة متصلة';

  @override
  String get printerConnected => 'الطابعة متصلة';

  @override
  String get connected => 'متصل';

  @override
  String get language => 'اللغة';

  @override
  String get selectLanguage => 'اختر لغة التطبيق';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';

  @override
  String get addProduct => 'إضافة منتج';

  @override
  String get editProduct => 'تعديل منتج';

  @override
  String get productName => 'اسم المنتج';

  @override
  String get barcode => 'الباركود';

  @override
  String get price => 'السعر';

  @override
  String get wholesalePrice => 'سعر الجملة';

  @override
  String get scanOrEnterBarcode => 'امسح أو أدخل الباركود';

  @override
  String get tapToOpenScanner => 'اضغط على الأيقونة لفتح الكاميرا';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get totalSales => 'إجمالي المبيعات';

  @override
  String get totalRevenue => 'إجمالي الإيرادات';

  @override
  String get netProfit => 'صافي الربح';

  @override
  String get productsSold => 'المنتجات المباعة';

  @override
  String get today => 'اليوم';

  @override
  String get yesterday => 'أمس';

  @override
  String get allTime => 'الكل';

  @override
  String get salesBreakdown => 'تفصيل المبيعات';

  @override
  String get quantity => 'الكمية';

  @override
  String get revenue => 'الإيرادات';

  @override
  String get profit => 'الربح';

  @override
  String get noSalesData => 'لا توجد بيانات مبيعات';

  @override
  String get noSalesForPeriod => 'لم يتم تسجيل مبيعات في هذه الفترة.';

  @override
  String get cameraOff => 'الكاميرا متوقفة';

  @override
  String get cameraOffDesc => 'قم بتشغيل الكاميرا لبدء مسح الباركود تلقائياً.';

  @override
  String get turnOnCamera => 'تشغيل الكاميرا';

  @override
  String get listEmpty => 'القائمة فارغة';

  @override
  String get listEmptyDesc => 'ستظهر العناصر الممسوحة هنا أثناء مسح الكاميرا.';

  @override
  String get productNotFound => 'المنتج غير موجود';

  @override
  String get barcodeExists => 'يوجد منتج بهذا الباركود مسبقاً!';

  @override
  String get pleaseEnterBarcode => 'الرجاء إدخال الباركود';

  @override
  String get pleaseEnterName => 'الرجاء إدخال الاسم';

  @override
  String get shopDetailsNotLoaded => 'لم يتم تحميل بيانات المتجر';

  @override
  String get printedSuccessfully => 'تمت الطباعة بنجاح';
}
