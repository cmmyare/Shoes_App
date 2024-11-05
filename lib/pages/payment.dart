import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';


class PymentPage extends StatefulWidget {
  //Shoe shoe;
  const PymentPage({super.key});

  @override
  State<PymentPage> createState() => _PymentPageState();
}

class _PymentPageState extends State<PymentPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Payment")),
        backgroundColor: Colors.deepPurple[200],
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Column(
        children: [
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              onCreditCardWidgetChange: (CreditCardBrand brand) {}),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  // themeColor:Colors.blue
                  formKey: FormKey,

                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: '12/26',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: '867',
                    ),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Owner Name',
                      hintText: "Abdullahi Mohamed Mohamuud"
                    ),
                    cardNumberTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if(FormKey.currentState!.validate()){
                        print("Valid");
                    }else{
                      print("Invalid");
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'halter',
                        fontSize: 14,
                        package: 'flutter_credit_card',
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ))
        ],
      )),

    );
  }
  
  void onCreditCardModelChange(CreditCardModel CreditCardModel){
    setState(() {
      cardNumber = CreditCardModel.cardNumber;
      expiryDate = CreditCardModel.expiryDate;
      cardHolderName = CreditCardModel.cardHolderName;
      cvvCode = CreditCardModel.cvvCode;
      isCvvFocused = CreditCardModel.isCvvFocused;
    });

  }
}
