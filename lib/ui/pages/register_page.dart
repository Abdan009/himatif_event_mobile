part of 'pages.dart';

class SignUpFormPage extends StatefulWidget {
  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController angkatanController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  bool isLogin = false;
  String selectedJK;
  String selectedMajor = 'Teknik Informatika';
  String selectedStudyProgram;
  String roles = 'Mahasiswa';
  File selectedFoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('Daftar'), body: buildFromRegistrasi(context));
  }

  Widget buildFromRegistrasi(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: mainColor),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: accentColor1,
                          image: (selectedFoto != null)
                              ? DecorationImage(
                                  image: FileImage(selectedFoto),
                                  fit: BoxFit.cover)
                              : null),
                      child: (selectedFoto == null)
                          ? Icon(Icons.person, size: 50, color: Colors.grey)
                          : SizedBox(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: mainColor,
                      ),
                      child: Text(
                        'Pilih foto',
                        style: whiteTextFont,
                      ),
                      onPressed: () async {
                        selectedFoto = await getImage();
                        setState(() {});
                      }),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Profil',
                style: blackTextFont.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(namaController, 'Nama Lengkap'),
              SizedBox(
                height: 10,
              ),
              ComboboxWidget(
                  list: ['Laki-Laki', 'Perempuan'],
                  onChange: (value) {
                    setState(() {
                      selectedJK = value;
                    });
                  },
                  value: selectedJK,
                  text: 'Jenis Kelamin'),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(emailController, 'Email'),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(
                phoneNumberController,
                'No.Hp',
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "+62",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                inputFormater: [FilteringTextInputFormatter.digitsOnly],
                typeText: TextInputType.numberWithOptions(),
                maxLines: 1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'note: Dimohon untuk memasukan nomor hp yang aktif, supaya dapat memudahkan menghubungi anda',
                style: greyTextFont,
              ),
              SizedBox(
                height: 10,
              ),
              ComboboxWidget(
                  list: ['Teknik Informatika'],
                  onChange: (value) {
                    setState(() {
                      selectedMajor = value;
                    });
                  },
                  value: selectedMajor,
                  text: 'Jurusan'),
              SizedBox(
                height: 10,
              ),
              ComboboxWidget(
                  list: [
                    'D3 Teknik Informatika',
                    'D3 Keperawatan',
                    'D4 Rekayasa Perangkat Lunak'
                  ],
                  onChange: (value) {
                    setState(() {
                      selectedStudyProgram = value;
                    });
                  },
                  value: selectedStudyProgram,
                  text: 'Prodi'),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(angkatanController, 'Tahun Angkatan'),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(
                addressController,
                'Alamat Lengkap',
                height: 100,
              ),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(
                passwordController,
                'Password',
                obsecureText: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 10,
              ),
              FieldInputDua(
                repeatPasswordController,
                'Ulangi Password',
                obsecureText: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 90,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
              )
            ]),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (!isLogin)
                    ? Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: mainColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(51)),
                            ),
                            child: Text(
                              'Daftar',
                              style: whiteTextFont,
                            ),
                            onPressed: () async {
                              if (!(namaController.text.trim() != "" &&
                                  emailController.text.trim() != "" &&
                                  phoneNumberController.text.trim() != "" &&
                                  phoneNumberController.text.trim() != "" &&
                                  angkatanController.text.trim() != "" &&
                                  addressController.text.trim() != "" &&
                                  passwordController.text.trim() != "" &&
                                  repeatPasswordController.text.trim() != "" &&
                                  selectedJK != null &&
                                  selectedMajor != null &&
                                  selectedStudyProgram != null)) {
                                return flushbar(
                                    "Harap isi seluruh data terlebih dahulu",
                                    context);
                              } else if (passwordController.text.trim() !=
                                  repeatPasswordController.text.trim()) {
                                return flushbar(
                                    "Password yang anda masukan tidak sama",
                                    context);
                              } else {
                                setState(() {
                                  isLogin = true;
                                });

                                Users user = Users(
                                    email: emailController.text,
                                    name: namaController.text,
                                    majors: selectedMajor,
                                    studyProgram: selectedStudyProgram,
                                    yearGeneration: angkatanController.text,
                                    photoURL: '',
                                    phoneNumber: phoneNumberController.text,
                                    tokenNotif: 'test',
                                    roles: 'Mahasiswa',
                                    gender: selectedJK,
                                    address: addressController.text);

                                await context.read<UsersCubit>().register(
                                      user,
                                      passwordController.text,
                                      photoProfile: selectedFoto,
                                    );
                                var state = context.read<UsersCubit>().state;
                                if (state is UsersLoaded) {
                                  context.read<EventCubit>().getListEvent();
                                  context
                                      .read<CategoryCubit>()
                                      .getListCategory();

                                  Get.offAll(() => MahasiswaMainPage());
                                } else {
                                  setState(() {
                                    isLogin = false;
                                  });
                                  flushbar(
                                      'Registrasi gagal, harap mencoba kembali',
                                      context);
                                }
                              }
                            }),
                      )
                    : loading(3),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun ? ',
                        style: greyTextFont,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'Masuk',
                            style: orangeTextFont,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
          ),
        )
      ],
    );
  }
}
