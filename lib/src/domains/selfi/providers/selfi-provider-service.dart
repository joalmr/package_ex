import 'package:package_ejemplo/src/domains/selfi/providers/selfi-provider.dart';
import 'package:package_ejemplo/src/libs/provider/api-provider.dart';

class SelfiProviderService extends SelfiProvider {
  final ApiProvider api;
  SelfiProviderService(this.api) {}

  getValidation() {
    return api.get('/validation');
  }
}
