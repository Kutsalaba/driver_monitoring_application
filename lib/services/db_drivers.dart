import 'package:injectable/injectable.dart';

import 'db_service.dart';

@injectable
class DbDrivers {
  DbDrivers(this.dbService);

  final DbService dbService;
}
