import 'package:flutter/material.dart';
import 'package:food_and_drug_admin/assets/constants.dart';
import 'package:food_and_drug_admin/widgets/credit_debit_card.dart';
import 'package:food_and_drug_admin/widgets/suscription_card.dart';

class UserInfoTab extends StatefulWidget {
  const UserInfoTab({Key? key}) : super(key: key);

  @override
  State<UserInfoTab> createState() => _UserInfoTabState();
}

class _UserInfoTabState extends State<UserInfoTab> {
  final _labelStyle = const TextStyle(
    fontSize: 16.0,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );

  Container _userInfoContainer({required child}) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          width: 2.0,
          color: Colors.grey.shade300,
        ),
      ),
      child: child,
    );
  }

  Row _userDataChunk({required String label, required String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          width: 160.0,
          child: Text(
            data,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 42.0),
              Text(
                "FDA App",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/auth/complete-profile");
              },
              child: const Icon(Icons.account_circle, size: 56.0),
            ),
            const Text("Nombre apellido :)"),
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/auth/complete-profile");
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22.0),
        Text("Datos de contacto", style: _labelStyle),
        _userInfoContainer(
          child: Column(
            children: [
              _userDataChunk(label: "Edad", data: "22"),
              _userDataChunk(
                  label: "Correo electrónico", data: "santoehu@mail.com"),
              _userDataChunk(label: "Sexo", data: "Elle"),
              _userDataChunk(label: "País", data: "Perú"),
            ],
          ),
        ),
        Text("Suscripciones", style: _labelStyle),
        _userInfoContainer(
          child: false ? const Text("No cuenta con ninguna suscripción") : Wrap(
            runSpacing: 10.0,
            children: const [
              SuscriptionCard(
                name: "FDA APP monthly subs",
                expiryDate: "01 enero 2022",
                amount: 20.0,
              ),
              SuscriptionCard(
                name: "FDA APP yearly subs",
                expiryDate: "17 agosto 2022",
                amount: 100.0,
              ),
            ],
          ),
        ),
        Text("Tarjetas de pago", style: _labelStyle),
        _userInfoContainer(
          child: Wrap(runSpacing: 10.0, children: const [
            CreditDebitCard(
              cardType: PaymentCard.visa,
              expiryDate: "10/26",
              lastDigits: "123",
            ),
            CreditDebitCard(
              cardType: PaymentCard.mastercard,
              expiryDate: "02/24",
              lastDigits: "986",
            ),
          ]),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              fixedSize: const Size(240, 20),
            ),
            child: const Text("Cerrar sesión"),
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.grey.shade200,
              fixedSize: const Size(240, 20),
            ),
            child: Text(
              "Borrar cuenta",
              style: TextStyle(color: Colors.red.shade800),
            ),
          ),
        ),
      ],
    );
  }
}
