import 'package:package_ejemplo/src/domains/selfi/providers/selfi-provider.dart';
import 'package:package_ejemplo/src/domains/selfi/repositories/selfi-mapping.dart';

class SelfiRepository {
  final SelfiProvider selfiProvider;
  final SelfiMapping selfiMapping;
  SelfiRepository(this.selfiProvider, this.selfiMapping);

  Future<dynamic> validate() {
    return Stream.fromFuture(this.selfiProvider.getValidation())
        .map(this.selfiMapping.toResponse)
        .handleError(this.selfiMapping.toError)
        .first;
  }
}
