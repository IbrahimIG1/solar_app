import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/shared_prefrence.dart';
import 'package:solar/core/models/app_categories.dart';
import 'package:solar/core/models/category_details_model.dart';
import 'package:solar/core/table/table_services.dart';
import 'package:solar/core/widgets/pdf_design/pdf_generator/pdf_generator.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_state.dart';
import 'package:solar/features/home/screens/price_offers/logic/repo/price_offers_repo.dart';

class LightingCategoriesCalculationCubit
    extends Cubit<LightingCategoriesCalculationState> {
  final PriceOffersRepo lightingCategoriesRepo;
  final TableSevices tableSevices;
  LightingCategoriesCalculationCubit(
    this.lightingCategoriesRepo,
    this.tableSevices,
  ) : super(LightingCategoriesCalculationInitial());

  static LightingCategoriesCalculationCubit get(context) =>
      BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //* pdf data controllers
  final TextEditingController typeController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryNumberController =
      TextEditingController();
  //* drop down button controllers
  String dropDownTypeValue = "No Value choise";
  String dropDownCapacityValue = "No Value choise";

  //* admin save data controllers
  final TextEditingController typeAdminController = TextEditingController();
  final TextEditingController capacityAdminController = TextEditingController();
  final TextEditingController priceAdminController = TextEditingController();
  final TextEditingController categoryNameAdminController =
      TextEditingController();

  List<Map<String, dynamic>> lightingItemsData =
      AppCategories.lightingItemsData;

  List<String> categoriesName = AppCategories.categoriesName;

//* type name list show in drop down button in form details
  List<String> typeNamesList = [
    "type-1",
    "type-2",
    "type-3",
  ];

//* capaciy name list show in drop down button in form details
  List<String> capaciyNamesList = [
    "capaciy-1",
    "capaciy-2",
    "capaciy-3",
  ];

//* this list will have all categories prices data.
  List<TableRow> tableData = [];

//* add Details Data From Database to show it in drop down button in form
  CategoryDetailsModel? categoryDetailsModel;
  void addDetailsDataToDatabase() async {
    emit(AddCategoriesDetailsLoading());
    categoryDetailsModel = CategoryDetailsModel(
      type: typeAdminController.text,
      capacity: capacityAdminController.text,
      price: priceAdminController.text,
      categoryName: categoryNameAdminController.text,
    );
    final response = await lightingCategoriesRepo.addLightinDetailsData(
        categoryDetailsModel: categoryDetailsModel!);
    response.when(success: (data) {
      emit(AddCategoriesDetailsSuccess());
      getPricesTableData();
    }, failure: (error) {
      emit(AddCategoriesDetailsError(error));
    });
  }

  //* this function will show prices data from prices table to drowp down button list.
  void getDetailsDataFromDatabase(Map<String, dynamic> itemData) async {
    emit(GetCategoriesDetailsLoading());
    final response =
        await lightingCategoriesRepo.getLightinDetailsDataFromData();
    response.when(success: (data) {
      typeNamesList = [
        "type-1",
        "type-2",
        "type-3",
      ];
      capaciyNamesList = [
        "capaciy-1",
        "capaciy-2",
        "capaciy-3",
      ];
      data.forEach((element) {
        //* to add the item type only in drop down button list.
        if (itemData['name'] == element['categoryName']) {
          typeNamesList.add(element['type'].toString());
          capaciyNamesList.add(element['capacity'].toString());
        }
      });
      emit(GetCategoriesDetailsSuccess());
    }, failure: (error) {
      print("get Details Data Error From Database");
      emit(GetCategoriesDetailsError(error));
    });
  }

  // get categories detailes data from [categoryDetailsTableName] database before open prices database screen.
  void getPricesTableData() async {
    final response =
        await lightingCategoriesRepo.getLightinDetailsDataFromData();
    response.when(success: (data) {
      tableData = [];
      //* lood on data and added in table
      data.forEach((element) {
        addRowInTable(
            name: element['type'].toString(),
            capacity: element['capacity'].toString(),
            price: element['price'].toString()
            // element['name'].toString()
            );
      });
      emit(GetCategoriesDetailsSuccess());
    }, failure: (error) {
      emit(GetCategoriesDetailsError(error));
    });
  }

  //* Add row When new any data added to database >>>>> called it in get [getPricesTableData]
  addRowInTable({
    required String name,
    required String capacity,
    required String price,
  }) {
    //* this [tableData] has all data
    tableSevices.addRowInTable(name, capacity, price, tableData);
    emit(AddRowInTableSuccess());
  }

  List<Map<String, dynamic>> pdfData = [];

  //* save data in shared prefrence becuse if i don't i will get only last saved item.
  //* so i save it to get all of items before extract pdf.
  void savePdfContent(BuildContext context) {
    pdfData = [
      {
        "name": dropDownTypeValue,
        "capacity": dropDownCapacityValue,
        "price": priceController.text,
      },
    ];
    //* save data to use it in pdf
    //* save list in shared prefrence to get it when i generate pdf
    SharedPref().saveListOfMaps(pdfData);
    Navigator.pop(context, true);
    emit(IsDoneLightingCategories());
  }

  //* get data from shared prefrence
  Future<List<Map<String, dynamic>>> getPdfData() async {
    //* get items data which saved before to save all items not last item only.
    final data = await SharedPref().getListOfMaps();
    //* save all data in [pdfData] to use it.
    pdfData = data;
    print("get Pdf Data done pdf data is $pdfData");
    return pdfData;
  }

  //* pdf generate (extract)
  void pdfGenerate() async {
    printOrSave(
      pdfData: await getPdfData(),
    ).then((value) {
      resetToDefault();
      emit(ResetCategoriesData());
    });
    emit(ResetCategoriesData());
  }

  //* reset Categories to default without chek mark or data
  void resetToDefault() {
    lightingItemsData.forEach((element) {
      element['is_done'] = false;
    });
    deletePdfContent();
    emit(ResetCategoriesData());
  }

  //* delete pdf contetnt after extract
  void deletePdfContent() {
    print("deleted");
    SharedPref().removeData(pdfContent);
  }

//* only emit after select value from drop down button to save the new data
  void valueSelected() {
    emit(SaveValueSeleted());
  }

  //* this list has all pdf extracted to show it in screen
  List<FileSystemEntity> pdfFiles = [];
  //* Get all pdf from the directory i saved in it
  void getAllPdf() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final dir = Directory(directory.path);
    // List all PDF files in the directory
    final List<FileSystemEntity> files =
        dir.listSync().where((file) => file.path.endsWith('.pdf')).toList();
    print("dir is >>>> $dir");
    pdfFiles = files;
    emit(GetAllPdfSuccess());
  }

  //* Open pdf file From All Screen PDF In app
  void openPdf(String filePath) async {
    // OpenFile is package open_file
    OpenFile.open(filePath); // Open the file if it exists
  }

  //* Delete Pdf from Pdf screen
  void deletePdf(String path, BuildContext context) {
    File(path).delete().then((value) {
      getAllPdf();
      context.pop();
      emit(DeletePdfSuccess());
      print("in then >>>> DeletePdfSuccess");
    });
    print(" out >>> DeletePdfSuccess");
  }
}
