
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/BloC/translator_bloc.dart';
import 'package:translator/Repository/Model_Class/TranslatorModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<String> text = [];
TextEditingController controller = TextEditingController();
late TranslatorModel data;


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Google',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              ' Translator',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        )),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 350,height: 200,
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 500,
                        controller: controller,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Enter text',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 25),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<TranslatorBloc, TranslatorState>(
                builder: (context, state) {
              if (state is TranslatorBlocLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is TranslatorBlocError) {
                return Center(
                  child: Text(
                    ':(',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 50),
                  ),
                );
              }
              if (state is TranslatorBlocLoaded) {
                data = BlocProvider.of<TranslatorBloc>(context).translatorModel;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 370,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(data.trans.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    ),
                  ),
                );
              }else{
                return SizedBox();
              }
            }
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: (){
                    print(controller.text);
                    BlocProvider.of<TranslatorBloc>(context).add(FetchTranslator(text: controller.text));
                  },

                  child: Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue[700]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.repeat_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          '   Translate text',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
