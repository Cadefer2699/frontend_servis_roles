
import 'package:flutter/material.dart';
import 'package:rolusuario/src/pages/login/login_controller.dart';
import 'package:rolusuario/src/utils/my_colors.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  LoginController con = LoginController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: -80,
                left: -100,
                child: _circleLogin()
            ),
            Positioned(
                top: 60,
                left: 25,
                child: _textLogin()
            ),
            ListView(
              children: [
                Column(
                  children: [
                    _imageBanner(context),
                    _textFieldEmail(),
                    _textFieldPassword(),
                    _bottonIngresar(),
                    _textDontHaveAccount(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _textDontHaveAccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(
            color: MyColors.primaryColor,
          ),
        ),
        SizedBox(width: 7),
        Text(
          'Registrate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors.primaryColor
          ),
        ),
      ],
    );
  }

  Widget _bottonIngresar(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: () => con.login(),
        child: Text('Ingresar'),
        style: ElevatedButton.styleFrom(
          primary: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: con.passwordController,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.password,
            color: MyColors.primaryColor,
          ),
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark
          )
        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: con.emailController,
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.email,
            color: MyColors.primaryColor,
          ),
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark
          )
        ),
      ),
    );
  }

  Widget _imageBanner(context){
    return Container(
      margin: EdgeInsets.only(
        top: 100,
        bottom: MediaQuery.of(context).size.height * 0.22
      ),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _textLogin(){
    return Text(
      'LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22
      ),
    );
  }

  Widget _circleLogin(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor,
      ),
    );
  }
}

