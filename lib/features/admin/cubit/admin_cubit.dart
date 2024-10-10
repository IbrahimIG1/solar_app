import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/models/inverter_model/inverter_data_model.dart';
import 'package:solar/core/models/inverter_model/inverter_model.dart';
import 'package:solar/core/models/panal_model/panal_data_model.dart';
import 'package:solar/core/models/panal_model/panal_model.dart';
import 'package:solar/features/admin/add_data_to_firebase.dart';
import 'package:solar/features/admin/cubit/admin_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/inverters_repo.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/panals_repo.dart';

class AdminCubit extends Cubit<AdminState> {
  final PanalsRepo panalsRepo;
  final InverterRepo inverterRepo;

  AdminCubit(this.panalsRepo, this.inverterRepo) : super(AdminInitial());

  static AdminCubit get(context) => BlocProvider.of(context);

  DeviceType? selectedDevice = DeviceType.panel;
  void changeRadioButtonValue(DeviceType? value) {
    selectedDevice = value;
    dropdownValue = "";
    emit(ChangeRadioButtonsSuccess());
  }

  //* Controllers
  TextEditingController pmaxController = TextEditingController();
  TextEditingController iscController = TextEditingController();
  TextEditingController vmpController = TextEditingController();
  TextEditingController vocController = TextEditingController();
  TextEditingController impController = TextEditingController();
  String dropdownValue = "";

  //* form key
  final formKey = GlobalKey<FormState>();
  //* Drop down panal list values
  List<String> inverterTypeList = [
    "Veichi",
    "Huawai",
    "Yaskawa",
    "Invt",
    "Delixi",
  ];
  List<String> panalTypeList = [
    "Jinko",
    "Trina",
    "Longi",
    "JA",
    "Canadian",
    "Suntech",
    "Ameri",
    "Risen",
    "Twinsel",
    "YinGli",
    "Solar Fabrik",
    "Lesso",
  ];

  //* Lists to save all values on the same panal type
  List<double> pmax = [];
  List<double> isc = [];
  List<double> vmp = [];
  List<double> voc = [];
  List<double> imp = [];

  //* Add Panals Data on FireStore
  Future<void> addPanalsData({required PanalModel panalModel}) async {
    emit(AddDataLoading());
    pmax.add(double.parse(pmaxController.text));
    isc.add(double.parse(iscController.text));
    vmp.add(double.parse(vmpController.text));
    voc.add(double.parse(vocController.text));
    imp.add(double.parse(impController.text));
    print("Add Panal Data Start");
    PanalDataModel panalDataModel = PanalDataModel(
        name: dropdownValue,
        pmax: pmax,
        voc: voc,
        isc: isc,
        vmp: vmp,
        imp: imp);
    PanalModel panalModel = PanalModel(panalDataModel);
    panals = {};
    final response = await panalsRepo.addData(
      docUid: panalModel.data.name,
      data: panalModel.toMap(),
    );
    response.when(success: (data) {
      print("Add Panal Data Success");
      resetCotrollersData();
      emit(AddPanalDataSuccess());
    }, failure: (error) {
      print("Add Panal Data Error >> $error");

      emit(AddPanalDataError(error));
    });
  }

  //* Lists to save all values on the same panal type
  List<double> modelInverter = [];
  List<double> input1DC = [];
  List<double> input2DC = [];
  List<double> maxInputDC = [];
  List<double> ratedOutputCurrent = [];
//* Add Panals Data on FireStore
  Future<void> addInvertersData({required InverterModel invetrerModel}) async {
    emit(AddDataLoading());
    modelInverter.add(double.parse(pmaxController.text));
    input1DC.add(double.parse(vocController.text));
    input2DC.add(double.parse(iscController.text));
    maxInputDC.add(double.parse(vmpController.text));
    ratedOutputCurrent.add(double.parse(impController.text));
    print("add invetrer Data Start");
    InverterDataModel invetrerDataModel = InverterDataModel(
        name: dropdownValue,
        modelInverter: modelInverter,
        input1DC: input1DC,
        input2DC: input2DC,
        maxInputDC: maxInputDC,
        ratedOutputCurrent: ratedOutputCurrent);
    InverterModel inverterModel = InverterModel(invetrerDataModel);
    final response = await inverterRepo.addData(
      docUid: inverterModel.data.name,
      data: invetrerModel.toMap(),
    );
    response.when(success: (data) {
      print("Add Inverters Data Success");
      resetCotrollersData();
      emit(AddInvertersDataSuccess());
    }, failure: (error) {
      print("Add Inverters Data Error >> $error");

      emit(AddInvertersDataError(error));
    });
  }

  //* reset all controllers after add done
  void resetCotrollersData() {
    pmaxController.clear();
    iscController.clear();
    vmpController.clear();
    vocController.clear();
    impController.clear();
  }

  //* Get Data From Firebase and save it in [invertes] list
  Map panals = {};
  Future<void> getPanalsData({
    required String collectionName,
  }) async {
    resetPanalsData();
    print(">>>>>>>>>>>>>>>> GetPanalData Start");
    emit(GetPanalDataLoading());
    final response =
        await panalsRepo.getAllpanalssWithIds(collectionName: collectionName);
    response.when(success: (data) {
      print("data in when func >>>>>>> $data");
      if (!data.isNullOrEmpty()) {
        print("data in if condition >>>>>>> ${data.isNullOrEmpty()}");
        panals = data!;
        getPanalsSpecificData(collectionName: collectionName);
        print("Panals is >>>> $panals");
      }
      emit(GetPanalDataSuccess());
    }, failure: (error) {
      print("GetPanalDataError >> $error");
      emit(GetPanalDataError(error));
    });
  }

//* reset data befor get to not dublicate data
  void resetPanalsData() {
    panals = {};
    pmax = [];
    isc = [];
    vmp = [];
    voc = [];
    imp = [];
  }

  //* get Data From [panals] list and save every tyle value in specific list.
  getPanalsSpecificData({required String collectionName}) {
    for (int i = 0; i < panals.length; i++) {
      pmax = panals["data"]['pmax'] ?? [];
      imp = panals["data"]['imp'] ?? [];
      isc = panals["data"]['isc'] ?? [];
      vmp = panals["data"]['vmp'] ?? [];
      voc = panals["data"]['voc'] ?? [];
      print(
          "pmax is >>> $pmax\n imp is >>> $imp\n vmp is >>> $vmp\n isc is >>> $isc\n voc is >>> $voc");
    }
  }

//* Get Data From Firebase and save it in [invertes] list
  Map inverters = {};
  Future<void> getInvertersData({
    required String collectionName,
  }) async {
    resetInvertersData();
    print(">>>>>>>>>>>>>>>>>> Get Inverters Data Start");
    emit(GetInvertersDataLoading());
    final response =
        await inverterRepo.getInvertersWithIds(collectionName: collectionName);
    response.when(success: (data) {
      print("data in when func >>>>>>> $data");
      if (!data.isNullOrEmpty()) {
        print("data in if condition >>>>>>> ${data.isNullOrEmpty()}");
        inverters = data!;
        getInvertersSpecificData(collectionName: collectionName);
        print("inverters is >>>> $inverters");
      }
      emit(GetInvertersDataSuccess());
    }, failure: (error) {
      print("GetInvertersDataError >> $error");
      emit(GetInvertersDataError(error));
    });
  }

//* reset data befor get to not dublicate data
  void resetInvertersData() {
    inverters = {};
    modelInverter = [];
    input1DC = [];
    input2DC = [];
    maxInputDC = [];
    ratedOutputCurrent = [];
  }

  //* get Data From [panals] list and save every tyle value in specific list.
  getInvertersSpecificData({required String collectionName}) {
    for (int i = 0; i < inverters.length; i++) {
      modelInverter = inverters["data"]['model_inverter'] ?? [];
      input1DC = inverters["data"]['input_1dc'] ?? [];
      input2DC = inverters["data"]['input_2dc'] ?? [];
      maxInputDC = inverters["data"]['max_input_dc'] ?? [];
      ratedOutputCurrent = inverters["data"]['rated_output_current'] ?? [];
      print(
          "model_inverter is >>> $modelInverter /n input1DC is >>> $input1DC /n input2DC is >>> $input2DC/n maxInputDC is >>> $maxInputDC/n ratedOutputCurrent is >>> $ratedOutputCurrent");
    }
  }
}
