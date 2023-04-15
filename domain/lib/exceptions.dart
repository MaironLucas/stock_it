abstract class StockItException implements Exception {}

abstract class FormFieldException implements StockItException {}

abstract class FirebaseLoggableException implements StockItException {}

class UnexpectedException implements StockItException {}

class NoConnectionException implements StockItException {}

class DatabaseNotStartedException implements StockItException {}
