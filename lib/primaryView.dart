import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class Primary extends ConsumerStatefulWidget {
  const Primary({Key? key}) : super(key: key);

  @override
  ConsumerState<Primary> createState() => _PrimaryState();
}

var Organizations = [
  'Deep Cloud',
  'CloudAdda',
  'DadsCorp',
];

var ExpenseType = ['Travel', 'Fuel', 'Internet', 'Others'];

final CompanyDropDownStateProvider = StateProvider<String>((ref) {
  return Organizations[0];
});

final ExpenseDropDownStateProvider = StateProvider<String>((ref) {
  return ExpenseType[0];
});

class _PrimaryState extends ConsumerState<Primary> {
  late final GlobalKey<FormState> _formKey;
  var invoiceNumberctrl = TextEditingController();
  var amountCtrl = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  late final XFile? photo;
  

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    final CompanyDropDownvalue = ref.watch(CompanyDropDownStateProvider);
    final ExpenseDropDownvalue = ref.watch(ExpenseDropDownStateProvider);
    return Center(
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Text(
                  "Home",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      fontSize: 30),
                ),
              ),
        Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text("Company",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(12),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Company',
                      hintText: 'Select your Organization',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true, // Reduces height a bit
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // No border
                        borderRadius:
                            BorderRadius.circular(12), // Apply corner radius
                      ),
                    ),
                    value: CompanyDropDownvalue,
                    items: Organizations.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      ref.read(CompanyDropDownStateProvider.state).state =
                          value!;
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Expense Type",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 10.0,
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Expense Type',
                      hintText: 'Select your Type of expense',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true, // Reduces height a bit
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // No border
                        borderRadius:
                            BorderRadius.circular(12), // Apply corner radius
                      ),
                    ),
                    value: ExpenseDropDownvalue,
                    items: ExpenseType.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      ref.read(ExpenseDropDownStateProvider.state).state =
                          value!;
                    }),
              ),
              const SizedBox(height: 10),
              const Text("Invoice Number",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Material(
                  borderRadius: BorderRadius.circular(12),
                  elevation: 10.0,
                  child: TextFormField(
                      controller: invoiceNumberctrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter invoice number',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true, // Reduces height a bit
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // No border
                          borderRadius:
                              BorderRadius.circular(12), // Apply corner radius
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      })),
              const SizedBox(height: 10),
              const Text("₹ Amount",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Material(
                  borderRadius: BorderRadius.circular(12),
                  elevation: 10.0,
                  child: TextFormField(
                      controller: amountCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Amount in ₹',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true, // Reduces height a bit
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // No border
                          borderRadius:
                              BorderRadius.circular(12), // Apply corner radius
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some amount';
                        }
                        return null;
                      })),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.5, // <-- match_parent
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(10.0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide.none))),
                      onPressed: () async {
                        photo = await _picker.pickImage(source: ImageSource.camera);
                      },
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 35,
                      ),
                    )),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.3, // <-- match_parent
                    child:
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(10.0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide.none))),
                    onPressed: () => {},
                    child: const Text("Submit"),
                  )),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(10.0),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Theme.of(context).primaryColor)))),
                    onPressed: () => {},
                    child: Text("Cancel", style: TextStyle(color: Theme.of(context).primaryColor),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      ])
    );
  }
}
