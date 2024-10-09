import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/constance/constance.dart';
import 'package:solar/core/models/inverter_model/inverter_data_model.dart';
import 'package:solar/core/models/inverter_model/inverter_model.dart';
import 'package:solar/core/models/panal_model/panal_data_model.dart';
import 'package:solar/core/models/panal_model/panal_model.dart';
import 'package:solar/features/admin/add_data_to_firebase.dart';
import 'package:solar/features/admin/cubit/admin_state.dart';
import 'package:solar/features/home/screens/technical_offer_screen/logic/repo/firebase_repo.dart';

class AdminCubit extends Cubit<AdminState> {
  final FirebaseRepo firebaseRepo;

  AdminCubit(this.firebaseRepo) : super(AdminInitial());

  static AdminCubit get(context) => BlocProvider.of(context);

  DeviceType? selectedDevice = DeviceType.panel;
  void changeRadioButtonValue(DeviceType? value) {
    selectedDevice = value;
    panalTypeDropdownValue = "";
    emit(ChangeRadioButtonsSuccess());
  }

  //* Controllers
  TextEditingController pmaxController = TextEditingController();
  TextEditingController iscController = TextEditingController();
  TextEditingController vmpController = TextEditingController();
  TextEditingController vocController = TextEditingController();
  TextEditingController impController = TextEditingController();
  String panalTypeDropdownValue = "";

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
  List pmax = [];
  List isc = [];
  List vmp = [];
  List voc = [];
  List imp = [];

  //* Add Panals Data on FireStore
  Future<void> addPanalsData({required PanalModel panalModel}) async {
    emit(AddDataLoading());
    pmax.add(pmaxController.text);
    isc.add(iscController.text);
    vmp.add(vmpController.text);
    voc.add(vocController.text);
    imp.add(impController.text);
    print("AddPanalData Start");
    PanalDataModel panalDataModel =
        PanalDataModel(pmax: pmax, voc: voc, isc: isc, vmp: vmp, imp: imp);
    PanalModel panalModel = PanalModel(panalTypeDropdownValue, panalDataModel);
    final response = await firebaseRepo.addPanals(
        // typesNames: {"Types": panalTypeList},
        docUid: selectedDevice == DeviceType.panel ? panalUid : inverterUid,
        collection: selectedDevice == DeviceType.panel
            ? panalCollection
            : inverterCollection,
        panalsData: panalModel.data.toMap(),
        collectionName: panalModel.name);
    response.when(success: (data) {
      print("AddPanalDataSuccess");
      resetCotrollersData();
      emit(AddPanalDataSuccess());
    }, failure: (error) {
      print("AddPanalDataError >> $error");

      emit(AddPanalDataError(error));
    });
  }

  //* Lists to save all values on the same panal type
  List modelInverter = [];
  List input1DC = [];
  List input2DC = [];
  List maxInputDC = [];
  List ratedOutputCurrent = [];
//* Add Panals Data on FireStore
  Future<void> addInvertersData({required InverterModel invetrerModel}) async {
    emit(AddDataLoading());
    modelInverter.add(pmaxController.text);
    input1DC.add(iscController.text);
    input2DC.add(vmpController.text);
    maxInputDC.add(vocController.text);
    ratedOutputCurrent.add(impController.text);
    print("IddinvetrerData Start");
    InverterDataModel invetrerDataModel = InverterDataModel(
        modelInverter: modelInverter,
        input1DC: input1DC,
        input2DC: input2DC,
        maxInputDC: maxInputDC,
        ratedOutputCurrent: ratedOutputCurrent);
    InverterModel invetrerModel =
        InverterModel(panalTypeDropdownValue, invetrerDataModel);
    final response = await firebaseRepo.addPanals(
        // typesNames: {"Types": inverterTypeList},
        docUid: selectedDevice == DeviceType.panel ? panalUid : inverterUid,
        collection: selectedDevice == DeviceType.panel
            ? panalCollection
            : inverterCollection,
        panalsData: invetrerModel.data.toMap(),
        collectionName: invetrerModel.name);
    response.when(success: (data) {
      print("AddPanalDataSuccess");
      resetCotrollersData();
      emit(AddInvertersDataSuccess());
    }, failure: (error) {
      print("AddPanalDataError >> $error");

      emit(AddInvertersDataError(error));
    });
  }

  //* reset all controllers after add done
  void resetCotrollersData() {
    pmaxController.text = "";
    iscController.text = "";
    vmpController.text = "";
    vocController.text = "";
    impController.text = "";
  }

  //* reset all lists after add done
  void resetListssData() {
    panals = [];
    pmax = [];
    isc = [];
    vmp = [];
    voc = [];
    imp = [];
  }

//* this list hase all data about specific panal from firebase
  List<PanalDataModel> panals = [];

  //* Get Data From Firebase and save it in [invertes] list
  getPanalsData() async {
    resetListssData();
    print("GetPanalData Start");
    emit(GetPanalDataLoading());
    final response = await firebaseRepo.getAllpanals(
      collection: selectedDevice == DeviceType.panel
          ? panalCollection
          : inverterCollection,
      collectionName: panalTypeDropdownValue,
      docUid: selectedDevice == DeviceType.panel
          ? panalCollection
          : inverterCollection,
    );
    response.when(success: (data) {
      print("GetPanalDataSuccess");
      for (var doc in data.docs) {
        print("Docs data is >>>>>> ${doc.data()}");
        panals.add(PanalDataModel.fromMap(doc.data()));
      }
      print("panals is >>>>>>> ${panals[0].pmax}");
      getSpecificData();

      emit(GetPanalDataSuccess());
    }, failure: (error) {
      print("GetPanalDataError >> $error");
      emit(GetPanalDataError(error));
    });
  }

  //* get Data From [panals] list and save every tyle value in specific list.
  getSpecificData() {
    for (int i = 0; i < panals.length; i++) {
      pmax = panals[i].pmax;
      imp = panals[i].imp;
      isc = panals[i].isc;
      vmp = panals[i].vmp;
      voc = panals[i].voc;
      print(
          "pmax is >>> $pmax /n imp is >>> $imp /n imp is >>> $vmp/n imp is >>> $isc/n imp is >>> $voc");
    }
  }
}
