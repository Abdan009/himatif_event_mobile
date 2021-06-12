part of '../../pages.dart';

class UpdateEventAdminPage extends StatefulWidget {
  final EventInfo event;
  UpdateEventAdminPage({this.event});

  @override
  _UpdateEventAdminPageState createState() => _UpdateEventAdminPageState();
}

class _UpdateEventAdminPageState extends State<UpdateEventAdminPage> {
  File imageFileUpload;
  String selectedCategory;
  List<String> listCategory = [
    'Seminar',
    'Lomba',
    'Kelas',
    'Conference',
    'Beasiswa',
    'Magang',
    'Volunteering',
    'Pertunjukan',
    'Lainnya',
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController benefitController = TextEditingController();
  TextEditingController requirementsController = TextEditingController();
  TextEditingController penyelenggaraControler = TextEditingController();
  TextEditingController kontakPenyelenggaraController = TextEditingController();
  DateTime timeStart, timeRegLimit;
  bool isValid = false;
  String selectedCost;
  List<String> listCost = ['Gratis', 'Berbayar'];

  @override
  void initState() {
    super.initState();

    if (widget.event != null) {
      nameController.text = widget.event.name;
      costController.text = widget.event.cost;
      descriptionController.text = widget.event.description;
      locationController.text = widget.event.location;
      benefitController.text = widget.event.benefits;
      requirementsController.text = widget.event.requirements;
      penyelenggaraControler.text = widget.event.organizer;
      kontakPenyelenggaraController.text = widget.event.contactOrganizer;

      if (widget.event.cost == 'Gratis') {
        selectedCost = 'Gratis';
      } else {
        selectedCost = 'Berbayar';
      }
      timeStart = widget.event.timeStart;
      timeRegLimit = widget.event.timeReglimit;
      selectedCategory = widget.event.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar((widget.event != null) ? 'Update Event' : 'Tambah Event'),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            buildGetFoto(),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(nameController, 'Nama Event'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Kategori',
                      style: blackTextFont.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.start),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: BlocBuilder<CategoryCubit, CategoryState>(
                      builder: (_, categoryState) => Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: generateSelectCategory(
                          context,
                          (categoryState as CategoryLoaded)
                              .listCategory
                              .where((element) => element.name != "Semua")
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Batas Pendaftaran',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildGetTimeRegLimit(context),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Waktu Pelaksanaan',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  buildGetTimeStart(context),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Deskripsi',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(
                    descriptionController,
                    'Deskripsi',
                    height: 250,
                    textInputAction: TextInputAction.newline,
                    typeText: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Persyaratan dan Ketentuan',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(
                    requirementsController,
                    'Persyaratan dan Kententuan',
                    height: 150,
                    textInputAction: TextInputAction.newline,
                    typeText: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Manfaat',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(
                    benefitController,
                    'Manfaat/Keuntungan',
                    height: 100,
                    textInputAction: TextInputAction.newline,
                    typeText: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lokasi',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(locationController, 'Lokasi Pelaksanaan'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Biaya',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: generateSelectCost(context),
                      ),
                    ),
                  ),
                  if (selectedCost == 'Berbayar')
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        FieldInputDua(costController, 'Biaya'),
                      ],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Penyelenggara',
                    style: blackTextFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(penyelenggaraControler, 'Nama'),
                  SizedBox(
                    height: 10,
                  ),
                  FieldInputDua(
                    kontakPenyelenggaraController,
                    'Kontak Penyelenggara',
                    prefixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+62",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onChange: (change) {
                      print(change);
                      if (change.length >= 10) {
                        setState(() {
                          isValid = true;
                        });
                      } else {
                        setState(() {
                          isValid = false;
                        });
                      }
                    },
                    inputFormater: [FilteringTextInputFormatter.digitsOnly],
                    typeText: TextInputType.numberWithOptions(),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: BlocBuilder<UsersCubit, UsersState>(
                      builder: (_, userState) => Container(
                        width: 190,
                        height: 43,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(51),
                              ),
                              primary: mainColor,
                              elevation: 0),
                          child: Text(
                            (widget.event == null) ? "Tambahkan" : "Edit",
                            style: whiteTextFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            bool isNextValidasi = false;
                            if (widget.event == null) {
                              if (imageFileUpload == null) {
                                flushbar(
                                    'Harap tambahkan poster event', context);
                              } else {
                                isNextValidasi = true;
                              }
                            } else {
                              isNextValidasi = true;
                            }

                            (isNextValidasi)
                                ? await nextValidasi(
                                    (userState as UsersLoaded).user, context)
                                : print("ERROR- update event");
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
            // FieldInputDua(titleController, 'Judul'),
          ],
        ),
      ),
    );
  }

  Future nextValidasi(Users user, BuildContext context) async {
    if (!(nameController.text.trim() != "" &&
        descriptionController.text.trim() != "" &&
        locationController.text.trim() != "" &&
        benefitController.text.trim() != "" &&
        requirementsController.text.trim() != "" &&
        penyelenggaraControler.text.trim() != "" &&
        kontakPenyelenggaraController.text.trim() != "")) {
      flushbar('Harap isi seluruh data terlebih dahulu', context);
    } else if (selectedCost == null || costController.text.trim() == "") {
      flushbar('Harap tentukan biaya event', context);
    } else if (selectedCategory == null) {
      flushbar('Harap pilih kategori event', context);
    } else if (timeStart == null) {
      flushbar('Harap tentukan waktu pelaksanaan', context);
    } else if (timeRegLimit == null) {
      flushbar('Harap tentukan batas waktu pendaftaran', context);
    } else {
      loadingDialog(context, message: "Mohon tunggu").show();

      EventInfo event;
      if (widget.event == null) {
        event = EventInfo(
            idUser: user.id,
            name: nameController.text,
            cost: costController.text,
            posterEvent: '',
            user: user,
            description: descriptionController.text,
            category: selectedCategory,
            location: locationController.text,
            benefits: benefitController.text,
            requirements: requirementsController.text,
            timeStart: timeStart,
            timeReglimit: timeRegLimit,
            status: (user.roles == 'admin') ? 'Publish' : 'Pending',
            organizer: penyelenggaraControler.text,
            contactOrganizer: kontakPenyelenggaraController.text,
            timeCreate: DateTime.now(),
            timeUpdate: DateTime.now());
        await context.read<EventCubit>().addEvent(event, imageFileUpload).then(
          (value) {
            loadingDialog(context).hide();
            Get.back();
          },
        ).catchError(
          (e) {
            loadingDialog(context).hide();
            flushbar('Terjadi kesalahan saat upload : $e', context);
          },
        );
      } else {
        event = widget.event.copyWith2(
            name: nameController.text,
            cost: costController.text,
            description: descriptionController.text,
            location: locationController.text,
            benefits: benefitController.text,
            requirements: requirementsController.text,
            timeStart: timeStart,
            category: selectedCategory,
            timeReglimit: timeRegLimit,
            organizer: penyelenggaraControler.text,
            contactOrganizer: kontakPenyelenggaraController.text,
            timeUpdate: DateTime.now());
        await context
            .read<EventCubit>()
            .updateEvent(event, imageFileUpload)
            .then(
          (value) {
            loadingDialog(context).hide();
            Get.back();
          },
        ).catchError(
          (e) {
            print('error');
            print(e);
            loadingDialog(context).hide();
            flushbar('Terjadi kesalahan saat upload : $e', context);
          },
        );
      }
    }
  }

  Widget buildGetTimeRegLimit(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: timeRegLimit ?? DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2050),
        ).then(
          (valueDate) async {
            if (valueDate != null) {
              await showTimePicker(
                context: context,
                initialTime: (timeRegLimit == null)
                    ? TimeOfDay.now()
                    : TimeOfDay.fromDateTime(timeRegLimit),
              ).then(
                (valueTime) {
                  if (valueTime != null) {
                    setState(
                      () {
                        timeRegLimit = DateTime.utc(
                            valueDate.year,
                            valueDate.month,
                            valueDate.day,
                            valueTime.hour,
                            valueTime.minute);
                      },
                    );
                  }
                },
              );
            }
          },
        );
      },
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                width: Get.width * 0.5 - ((2 * defaultMargin) + 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    (timeRegLimit != null)
                        ? timeRegLimit.dateAndTimeLahir
                        : 'Hari/Tanggal',
                    style: blackTextFont,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              width: Get.width * 0.5 - ((2 * defaultMargin) + 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  (timeRegLimit != null) ? timeRegLimit.clockTime : 'Pukul',
                  style: blackTextFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGetTimeStart(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDatePicker(
          context: context,
          initialDate: timeStart ?? DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2050),
        ).then(
          (valueDate) async {
            if (valueDate != null) {
              await showTimePicker(
                context: context,
                initialTime: (timeStart == null)
                    ? TimeOfDay.now()
                    : TimeOfDay.fromDateTime(timeStart),
              ).then(
                (valueTime) {
                  if (valueTime != null) {
                    setState(
                      () {
                        timeStart = DateTime.utc(
                            valueDate.year,
                            valueDate.month,
                            valueDate.day,
                            valueTime.hour,
                            valueTime.minute);
                      },
                    );
                  }
                },
              );
            }
          },
        );
      },
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                width: Get.width * 0.5 - ((2 * defaultMargin) + 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    (timeStart != null)
                        ? timeStart.dateAndTimeLahir
                        : 'Hari/Tanggal',
                    style: blackTextFont,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              width: Get.width * 0.5 - ((2 * defaultMargin) + 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  (timeStart != null) ? timeStart.clockTime : 'Pukul',
                  style: blackTextFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center buildGetFoto() {
    return Center(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            FDottedLine(
              color: mainColor,
              corner: FDottedLineCorner.all(20),
              child: GestureDetector(
                onTap: () async {
                  await getImage().then((value) {
                    setState(() {
                      imageFileUpload = value;
                    });
                  });
                },
                child: Container(
                  height: Get.width / 1.5,
                  width: Get.width - (2 * 20),
                  decoration: BoxDecoration(
                      color: accentColor1,
                      borderRadius: BorderRadius.circular(20),
                      image: (imageFileUpload != null)
                          ? DecorationImage(
                              image: FileImage(imageFileUpload),
                              fit: BoxFit.cover)
                          : (widget.event != null)
                              ? DecorationImage(
                                  image:
                                      NetworkImage(widget.event?.posterEvent),
                                  fit: BoxFit.cover)
                              : null),
                  child: (imageFileUpload == null)
                      ? Center(
                          child: Text("Poster",
                              style: greyTextFont.copyWith(
                                  fontSize: 13, color: Colors.grey)),
                        )
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateSelectCategory(
      BuildContext buildContext, List<CategoryEvent> listCategory2) {
    return listCategory2
        .map((e) => SelectableBox(
              e.name,
              width: 100,
              height: 40,
              isSelected: selectedCategory == e.name,
              textStyle: blackTextFont.copyWith(fontSize: 15),
              onTap: () {
                setState(() {
                  selectedCategory = e.name;
                });
              },
            ))
        .toList();
  }

  List<Widget> generateSelectCost(BuildContext buildContext) {
    return listCost
        .map((e) => SelectableBox(
              e,
              width: 100,
              height: 40,
              isSelected: selectedCost == e,
              textStyle: blackTextFont.copyWith(fontSize: 15),
              onTap: () {
                if (e == 'Gratis') {
                  costController.text = 'Gratis';
                } else {
                  costController.text = '';
                }
                setState(() {
                  selectedCost = e;
                });
              },
            ))
        .toList();
  }
}
