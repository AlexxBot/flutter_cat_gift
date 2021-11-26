abstract class Failure {
  String message;
  Failure({this.message = 'Failure'});
}

class ServerFailure extends Failure {
  ServerFailure({message = 'Error en el servidor'}) : super(message: message);
}

// ignore: must_be_immutable
class TimeOutFailure extends Failure {
  TimeOutFailure({message = "Timeout"}) : super(message: message);
}

// ignore: must_be_immutable
class ApiResponseFailure extends Failure {
  ApiResponseFailure({message = 'Api response failure'})
      : super(message: message);
}
