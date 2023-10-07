void hello(){
  print("hello");
}
Future<String?> hello_there()async {
  String? a;
  await Future.delayed(Duration(seconds: 5),(){

    print("hey there");

    a="hi i am awaiting";
    return a;
  });

}

void hi(String o){
  print("hi there $o");
}

void main()async{
  hello();
  String? s= await hello_there();
  print("i am print function $s");
  hi(s!);
}

