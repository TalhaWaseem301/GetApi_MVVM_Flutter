class AppExcepions implements Exception{
  final message;
  final prefix;
  AppExcepions([this.message,this.prefix]);

  String toString(){
    return '$prefix$message';
  }
}

class InternetException extends AppExcepions{
  InternetException([String? message]) : super(message,'No Internet');
}

class RequestTimeOut extends AppExcepions{
  RequestTimeOut([String? message]) : super(message,'Request time out');
}

class ServerException extends AppExcepions{
  ServerException([String? message]) : super(message,'Internal sever error');
}

class InvalidUrlException extends AppExcepions{
  InvalidUrlException([String? message]) : super(message,'Internal sever error');
}

class FetchDataException extends AppExcepions{
  FetchDataException([String? message]) : super(message,'');
}