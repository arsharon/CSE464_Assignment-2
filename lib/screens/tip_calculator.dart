import 'package:assignment_2/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({super.key});

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  static const Color cardBackground = Color(0xffada2a2);
  static const Color calculateBtnColor = Color.fromARGB(255, 0, 0, 0);
  static const Color clearBtnColor = Color.fromARGB(255, 255, 117, 17);

  final formKey = GlobalKey<FormState>();

  double bill = 0.0;
  double tipPercentage = 0.0;
  int numberOfPeople = 0;
  double totalPayable = 0;

  double calculateTotalBill() {
    return bill * (1 + tipPercentage / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: "Tip Calculator",
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cardBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Total Bill",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "\$ ${totalPayable.toStringAsFixed(2)}",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bill",
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "\$ ${bill.toStringAsFixed(2)}",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Tip Amount",
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "\$ ${(bill * tipPercentage / 100).toStringAsFixed(2)}",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Total Persons",
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                numberOfPeople.toString(),
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: cardBackground,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Amount Per Person",
                      ),
                      Text(
                        "\$ ${numberOfPeople > 0 ? (totalPayable / numberOfPeople).toStringAsFixed(2) : '💰️'}",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total bill",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          bill = value.isEmpty ? 0 : double.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: cardBackground,
                        hintText: "Please enter total bill",
                        suffixIcon: const Icon(Icons.attach_money),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Tip percentage",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          tipPercentage =
                              value.isEmpty ? 0 : double.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: cardBackground,
                        hintText: "Please enter tip percentage",
                        suffixIcon: const Icon(Icons.percent),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Number of people",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          numberOfPeople = value.isEmpty ? 0 : int.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: cardBackground,
                        hintText: "Please enter number of people",
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(calculateBtnColor),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        formKey.currentState?.reset();
                        setState(() {
                          totalPayable = calculateTotalBill();
                        });
                      },
                      child: Text(
                        "Calculate",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(clearBtnColor),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: () {
                        formKey.currentState?.reset();
                        setState(() {
                          bill = 0;
                          tipPercentage = 0;
                          numberOfPeople = 0;
                        });
                      },
                      child: Text(
                        "Clear",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
