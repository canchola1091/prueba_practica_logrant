
import 'package:flutter/material.dart';
import 'package:test_logrant/models/people_model.dart';
import 'package:test_logrant/utils/my_utils.dart';
import 'package:test_logrant/widgets/shared/custom_simple_text.dart';

class DetailPersonView extends StatelessWidget {

  final Person person;
  
  const DetailPersonView({
    super.key,
    required this.person
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: CSimpleTxt(
          fTxt: 'Detalle persona',
          fSize: 18,
          fColor: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox( height: MyUtils.porcientoH(3)),
            SizedBox(
              child: Hero(
                tag: person.avatar,
                child: Image.network(
                  person.avatar,
                  fit: BoxFit.cover,
                ),
              )
            ),
            SizedBox( height: MyUtils.porcientoH(2)),
            ListTile(
              title: CSimpleTxt(
                fTxt: 'Nombre: ${person.firstName} ${person.lastName}',
                fSize: 17.0,
              ),
              subtitle: CSimpleTxt(
                fTxt: 'Email: ${person.email}',
                fSize: 17.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}