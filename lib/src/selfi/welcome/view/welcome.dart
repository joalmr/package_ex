import 'dart:ui';

import 'package:package_ejemplo/src/components/button_primary.dart';
import 'package:package_ejemplo/src/components/button_secondary.dart';
import 'package:package_ejemplo/src/selfi/take_picture/view/take_picture.dart';
import 'package:package_ejemplo/src/selfi/welcome/cubit/welcome_cubit.dart';
import 'package:package_ejemplo/src/style/styles.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePkg extends StatelessWidget {
  Widget advertisment(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Uso de datos personales',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: bluePacifico,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  '''Usted autoriza a Pacífico Seguros a recopilar y almacenar la información consignada en su documento de identidad, incluyendo su imagen, con la finalidad de verificar su identidad en ese y otros procesos que requieren autenticación.''',
                  style: TextStyle(color: Color(0xFF8b8d8e)),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  '''Mantendremos su información hasta diez años después de que finalice su relación contractual con Pacífico. No transferiremos su información a terceros no autorizados.''',
                  style: TextStyle(color: Color(0xFF8b8d8e)),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            child: GestureDetector(
              onTap: () {
                context
                    .read<WelcomeCubit>()
                    .btnPulse(!context.read<WelcomeCubit>().btnActive);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.read<WelcomeCubit>().btnActive
                          ? greenPacifico
                          : Colors.grey[100],
                      border: Border.all(
                        color: greenPacifico,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child:
                          context.read<WelcomeCubit>().state is WelcomeBtnPulse
                              ? Icon(
                                  Icons.check,
                                  size: 15.0,
                                  color: Colors.white,
                                )
                              : Icon(
                                  null,
                                  size: 15.0,
                                ),
                    ),
                  ),
                  Text(
                    'Acepto términos y condiciones',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),
          buttonPrimary(
            text: 'Sí, Acepto',
            minimumSize: Size(MediaQuery.of(context).size.width * 0.60, 35),
            onPressed: context.read<WelcomeCubit>().state is WelcomeBtnPulse
                ? () => context.read<WelcomeCubit>().accepted()
                : null,
          ),
        ],
      ),
    );
  }

  Widget step1(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: EasyRichText(
            'Validaremos tu identidad de formar sencilla',
            textAlign: TextAlign.center,
            defaultStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 24,
            ),
            patternList: [
              EasyRichTextPattern(
                targetString: 'Validaremos',
                style: TextStyle(color: bluePacifico),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          '''Recuerde de activar la cámara de su celular.''',
          style: TextStyle(color: Color(0xFF8b8d8e)),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 15),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: MediaQuery.of(context).size.width * 0.35,
            child: Column(
              children: [
                Image(
                  height: 100,
                  image: AssetImage('assets/images/circle-user.png'),
                ),
                SizedBox(height: 10),
                Text(
                  'Mire de frente a la cámara',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                buttonPrimary(
                  text: 'Comenzar',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context_) => AlertDialog(
                        title: Text(
                          'Antes de mirar a la cámara considera lo siguiente:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(7.5),
                                width: 140,
                                child: Column(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/group-1.png')),
                                    EasyRichText(
                                      'El lugar debe tener buena iluminación.',
                                      textAlign: TextAlign.center,
                                      defaultStyle:
                                          const TextStyle(color: Colors.black),
                                      patternList: [
                                        EasyRichTextPattern(
                                          targetString: 'buena iluminación',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(7.5),
                                width: 140,
                                child: Column(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/group-2.png')),
                                    EasyRichText(
                                      'Rostro descubierto, sin gafas ni prendas en la cabeza.',
                                      textAlign: TextAlign.center,
                                      defaultStyle:
                                          const TextStyle(color: Colors.black),
                                      patternList: [
                                        EasyRichTextPattern(
                                          targetString: 'Rostro descubierto',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(7.5),
                                width: 140,
                                child: Column(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/group-3.png')),
                                    EasyRichText(
                                      'Mira de frente a la cámara sin inclinar la cabeza.',
                                      textAlign: TextAlign.center,
                                      defaultStyle:
                                          const TextStyle(color: Colors.black),
                                      patternList: [
                                        EasyRichTextPattern(
                                          targetString:
                                              'Mira de frente a la cámara',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              buttonSecondary(
                                text: 'Continuar',
                                onPressed: () {
                                  Navigator.of(context_).pop();
                                  context.read<WelcomeCubit>().gotoPicture();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: EasyRichText(
            '''Esta es una página segura de Pacífico Seguros. Si tienes alguna duda comunicate con nosotros al (01) 513 5020 o a través de nuestros medios digitales''',
            textAlign: TextAlign.justify,
            defaultStyle: const TextStyle(
              color: Color(0xFF8b8d8e),
            ),
            patternList: [
              EasyRichTextPattern(
                targetString: 'Pacífico Seguros',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              EasyRichTextPattern(
                targetString: '(01)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              EasyRichTextPattern(
                targetString: '513 5020',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => WelcomeCubit(),
          child: BlocConsumer<WelcomeCubit, WelcomeState>(
            listener: (context, state) {
              print(state);
              if (state is WelcomeGoTo) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TakePicturePkg()),
                );
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case WelcomeInitial:
                  return advertisment(context);
                case WelcomeBtnPulse:
                  return advertisment(context);
                case WelcomeAccepted:
                  return step1(context);
                default:
                  return Scaffold();
              }
            },
          ),
        ),
      ),
    );
  }
}
