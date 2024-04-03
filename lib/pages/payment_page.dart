import 'package:delivery/components/my_button.dart';
import 'package:delivery/pages/delivery_progress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // user wants to pay

  void userTappedPay(){
    if(formKey.currentState!.validate()){
    // only show dialog if the form is valid
    showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Are you sure you want to pay?"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Card Number: $cardNumber"),
              Text("Expiry Date: $expiryDate"),
              Text("Card Holder Name: $cardHolderName"),
              Text("CVV Code: $cvvCode"),
            ],
          ),
        ),
        actions: [
          // cancel button
          TextButton(
            onPressed: () =>Navigator.pop(context),
            child: Text("Cancel"),
          ),

          // yes button
          TextButton(
            onPressed: (){ 
              Navigator.pop(context);
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> DeliveryProgressPage(),
              ),
            );
            },
           
            child: const Text("Yes"),
          ),
        ],
      )
    );
    }else{
      print('invalid');
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor:Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // credit card
          CreditCardWidget(
           cardNumber: cardNumber,
   
           expiryDate: expiryDate,
           cardHolderName: cardHolderName,
           cvvCode: cvvCode,
           showBackView: isCvvFocused,
           onCreditCardWidgetChange: (p0){},
          ),

          // credit card form
          CreditCardForm(cardNumber: cardNumber,
           expiryDate: expiryDate,
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data){
            setState((){
              cardNumber = data.cardNumber;
              expiryDate = data.expiryDate;
              cardHolderName = data.cardHolderName;
              cvvCode = data.cvvCode; 
            });
          }, 
          formKey: formKey
          ),

          const Spacer(),

          MyButon(onTap: userTappedPay, text: "Pay Now"),

          const SizedBox(height: 20 )
        ],
      ),
    );
  }
}