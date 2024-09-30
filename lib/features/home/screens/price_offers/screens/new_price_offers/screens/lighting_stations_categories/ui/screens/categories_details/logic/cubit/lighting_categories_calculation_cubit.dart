import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/helper/shared_prefrence.dart';
import 'package:solar/core/models/app_categories.dart';
import 'package:solar/core/models/category_details_model.dart';
import 'package:solar/core/widgets/pdf_design/pdf_generator/pdf_generator.dart';
import 'package:solar/features/home/screens/price_management/widgets/table_cell.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_state.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/repo/lighting_categories_calculation_repo.dart';

class LightingCategoriesCalculationCubit
    extends Cubit<LightingCategoriesCalculationState> {
  final LightingCategoriesCalculationRepo lightingCategoriesRepo;
  LightingCategoriesCalculationCubit(
    this.lightingCategoriesRepo,
  ) : super(LightingCategoriesCalculationInitial());

  static LightingCategoriesCalculationCubit get(context) =>
      BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //* pdf data controllers
  final TextEditingController typeController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();
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
  void addDetailsDataToDatabase() async {
    emit(AddCategoriesDetailsLoading());
    CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel(
      type: typeAdminController.text,
      capacity: capacityAdminController.text,
      price: priceAdminController.text,
      categoryName: categoryNameAdminController.text,
    );
    final response = await lightingCategoriesRepo.addLightinDetailsData(
        categoryDetailsModel: categoryDetailsModel);
    response.when(success: (data) {
      emit(AddCategoriesDetailsSuccess());
      getPricesTableData();
    }, failure: (error) {
      emit(AddCategoriesDetailsError(error));
    });
  }

  //* this function will show prices data in from prices table to drowp down button list. 
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
      data.forEach((element) {
        addRowInTable(element['type'].toString(),
            element['capacity'].toString(), element['price'].toString());
      });
      emit(GetCategoriesDetailsSuccess());
    }, failure: (error) {
      emit(GetCategoriesDetailsError(error));
    });
  }

  //* Add row has 3 cells in table
  addRowInTable(
    String name,
    String capacity,
    String price,
  ) {
    //* this tableData has all data
    tableData.add(TableRow(children: [
      buildTableCell(name),
      buildTableCell(capacity),
      buildTableCell(price),
    ]));
    emit(AddRowInTableSuccess());
  }

  List<Map<String, dynamic>> pdfData = [];

  //* save data in shared prefrence becuse if i don't i will get only last saved item.
  //* so i save it to get all of items before extract pdf.
  void savePdf(Map<String, dynamic> item, BuildContext context) {
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

  //* pdf generate
  void pdfGenerate() async {
printOrSave(pdfData: await getPdfData()).then((value) {
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
}
