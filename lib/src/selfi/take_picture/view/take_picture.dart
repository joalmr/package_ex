import 'package:package_ejemplo/src/components/button_primary.dart';
import 'package:package_ejemplo/src/components/button_secondary.dart';
import 'package:package_ejemplo/src/selfi/success/view/success.dart';
import 'package:package_ejemplo/src/selfi/take_picture/cubit/take_picture_cubit.dart';
import 'package:package_ejemplo/src/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TakePicturePkg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TakePictureCubit(),
      child: BlocConsumer<TakePictureCubit, TakePictureState>(
        listener: (context, state) {
          print(state);
          if (state is TakePictureGoTo) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SuccesPkg()),
            );
          }
          if (state is TakePictureFail) {
            final snackBar =
                SnackBar(content: Text('Error no se procesó la imagen'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Resultado de la foto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: bluePacifico,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    if (state is TakePictureInitial || state is TakePictureFail)
                      InkWell(
                        onTap: () =>
                            context.read<TakePictureCubit>().seleccionarFoto(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          radius: 80,
                        ),
                      ),
                    if (state is TakePictureWithImage)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: FileImage(
                              context.read<TakePictureCubit>().image!),
                          fit: BoxFit.cover,
                          height: 160,
                          width: 160,
                        ),
                      ),
                    SizedBox(height: 10),
                    buttonPrimary(
                      onPressed: (state is TakePictureInitial ||
                              state is TakePictureFail)
                          ? null
                          : () =>
                              context.read<TakePictureCubit>().gotoSuccess(),
                      text: 'Continuar',
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.60, 35),
                    ),
                    SizedBox(height: 10),
                    buttonSecondary(
                      onPressed: () =>
                          context.read<TakePictureCubit>().seleccionarFoto(),
                      text: 'Volver a tomar la foto',
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.60, 35),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
