import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/models/app_categories.dart';
import 'package:solar/core/models/category_details_model.dart';
import 'package:solar/features/home/screens/price_management/widgets/table_pdf.dart';
import 'package:solar/features/home/screens/price_management/widgets/table_cell.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/cubit/lighting_categories_calculation_state.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/logic/repo/lighting_categories_calculation_repo.dart';

class LightingCategoriesCalculationCubit
    extends Cubit<LightingCategoriesCalculationState> {
  final LightingCategoriesCalculationRepo lightingCategoriesRepo;
  LightingCategoriesCalculationCubit(this.lightingCategoriesRepo)
      : super(LightingCategoriesCalculationInitial());

  static LightingCategoriesCalculationCubit get(context) =>
      BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //* pdf data controllers
  final TextEditingController typeController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();

  //* admin save data controllers
  final TextEditingController typeAdminController = TextEditingController();
  final TextEditingController capacityAdminController = TextEditingController();
  final TextEditingController priceAdminController = TextEditingController();
  final TextEditingController categoryNameAdminController =
      TextEditingController();
  bool allIsDone = true;
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

  List<TableRow> tableData = [
    // TableRow(children: [
    //   buildTableCell("[row - 1]"),
    //   buildTableCell("[row - 2]"),
    //   buildTableCell("[row - 3]"),
    // ]),
    // TableRow(children: [
    //   buildTableCell("[row - 1]"),
    //   buildTableCell("[row - 2]"),
    //   buildTableCell("[row - 3]"),
    // ]),
    // TableRow(children: [
    //   buildTableCell("[row - 1]"),
    //   buildTableCell("[row - 2]"),
    //   buildTableCell("[row - 3]"),
    // ]),
  ];

//* get Details Data From Database to show it in drop down button in form
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
      getTableData();
    }, failure: (error) {
      emit(AddCategoriesDetailsError(error));
    });
  }

  //* get Details Data From Database to show it in drop down button in form
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
      tableData = [];

      data.forEach((element) {
        //* to add the item type only in drop down button list.
        if (itemData['name'] == element['categoryName']) {
          typeNamesList.add(element['type'].toString());
          capaciyNamesList.add(element['capacity'].toString());
        }

        // addRowInTable(element['type'].toString(),
        //     element['capacity'].toString(), 'price 100');
      });

      emit(GetCategoriesDetailsSuccess());
    }, failure: (error) {
      print("get Details Data Error From Database");
      emit(GetCategoriesDetailsError(error));
    });
  }

  void getTableData() async {
    final response =
        await lightingCategoriesRepo.getLightinDetailsDataFromData();
    response.when(success: (data) {
      tableData = [];
      data.forEach((element) {
        addRowInTable(element['type'].toString(),
            element['capacity'].toString(), 'price 100');
      });
      print("get Table Data success From Database");

      emit(GetCategoriesDetailsSuccess());
    }, failure: (error) {
      print("get Table Data Error From Database");
      emit(GetCategoriesDetailsError(error));
    });
  }

  addRowInTable(
    String name,
    String capacity,
    String price,
  ) {
    tableData.add(TableRow(children: [
      buildTableCell(name),
      buildTableCell(capacity),
      buildTableCell(price),
    ]));
    emit(AddRowInTableSuccess());
  }

  List<Map<String, dynamic>> pdfData = [];

  void savePdf(Map<String, dynamic> item, BuildContext context) {
    pdfData.add(item);
    print(item['is_done']);
    print("item Items >>> ${item}");
    print("Pdf Items >>> ${pdfData.length}");
    print("name in pdf >>> ${pdfData[0]['name']}");
    Navigator.pop(context, true);
    emit(IsDoneLightingCategories());
  }

  void getPdfData(Map<String, dynamic> item) {
    pdfData.add(item);
  }

  // pdf Func
  void pdfGenerate() {
    // if (!pdfData.isNullOrEmpty())
    TablePdf.printOrSave(pdfData: pdfData);
  }
}
