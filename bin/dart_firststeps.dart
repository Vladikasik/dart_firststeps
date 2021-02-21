import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

void main(){
  print(firstLaunch().runtimeType);
  if (firstLaunch() == Null){
    stdout.write('Enter you login for diary:');
    var login = stdin.readLineSync();

    // infinitive loop waiting passwords to match eachother
    var password = utf8.encode(checkPass());
    var hashedPassword = sha1.convert(password);
    // making json string for session
    var jsonSession =
    '''
    {
    "Login": $login,
    "PasswordHash": $hashedPassword
    }
    ''';

    writeSession(jsonSession);

  }else{
    print('one another time');
  }
}

String checkPass(){
  // chek if passwords match
  stdout.write('OK then. Type your password ');
  var password_1 = stdin.readLineSync();
  stdout.write('OK then. Confirm your password your password ');
  var password_2 = stdin.readLineSync();
  if (password_1 == password_2){
    stdout.write('Writing all the stuff to database ');
    return password_1;
  }else{
     return checkPass();
  }
}
bool firstLaunch(){
  
}

String readJson(){
  checkPass();
}

void writeSession(string){

  var file = File('session');
  var sink = file.openWrite();
  sink.write(string);
  sink.close();
}