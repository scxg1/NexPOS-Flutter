// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'NexPOS';

  @override
  String get scannedItems => 'Scanned Items';

  @override
  String itemsTotal(int count) {
    return '$count items total';
  }

  @override
  String get reviewOrder => 'Review Order';

  @override
  String get checkout => 'Checkout';

  @override
  String get grandTotal => 'Grand Total';

  @override
  String get totalPrice => 'Total Price';

  @override
  String get printReceipt => 'Print Receipt';

  @override
  String get scanToPay => 'Scan to Pay';

  @override
  String get settings => 'Settings';

  @override
  String get products => 'Products';

  @override
  String get manageStockBarcodes => 'Manage stock and barcodes';

  @override
  String get shopDetails => 'Shop Details';

  @override
  String get editBusinessInfo => 'Edit business info & address';

  @override
  String get management => 'Management';

  @override
  String get hardware => 'Hardware';

  @override
  String get printDevice => 'Print Device';

  @override
  String get noPrinterConnected => 'No printer connected';

  @override
  String get printerConnected => 'Printer connected';

  @override
  String get connected => 'CONNECTED';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select app language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic (عربي)';

  @override
  String get addProduct => 'Add Product';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get productName => 'Product Name';

  @override
  String get barcode => 'Barcode';

  @override
  String get price => 'Price';

  @override
  String get wholesalePrice => 'Wholesale Price';

  @override
  String get scanOrEnterBarcode => 'Scan or enter barcode';

  @override
  String get tapToOpenScanner => 'Tap the icon to open camera scanner';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get totalSales => 'Total Sales';

  @override
  String get totalRevenue => 'Total Revenue';

  @override
  String get netProfit => 'Net Profit';

  @override
  String get productsSold => 'Products Sold';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get allTime => 'All Time';

  @override
  String get salesBreakdown => 'Sales Breakdown';

  @override
  String get quantity => 'Qty';

  @override
  String get revenue => 'Revenue';

  @override
  String get profit => 'Profit';

  @override
  String get noSalesData => 'No sales data';

  @override
  String get noSalesForPeriod => 'No sales recorded for this period.';

  @override
  String get cameraOff => 'Camera is turned off';

  @override
  String get cameraOffDesc =>
      'Turn on your camera to start scanning barcodes and items automatically.';

  @override
  String get turnOnCamera => 'Turn on Camera';

  @override
  String get listEmpty => 'List is empty';

  @override
  String get listEmptyDesc =>
      'Scanned items will appear here as you scan them with the camera above.';

  @override
  String get productNotFound => 'Product not found';

  @override
  String get barcodeExists => 'Product with barcode already exists!';

  @override
  String get pleaseEnterBarcode => 'Please enter a barcode';

  @override
  String get pleaseEnterName => 'Please enter a name';

  @override
  String get shopDetailsNotLoaded => 'Shop details not loaded';

  @override
  String get printedSuccessfully => 'Printed successfully';
}
