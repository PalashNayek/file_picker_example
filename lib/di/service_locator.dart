import 'package:get_it/get_it.dart';

import '../services/file_picker_service.dart';
import '../view_models/file_picker_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register FilePickerService as a singleton
  getIt.registerLazySingleton<FilePickerService>(() => FilePickerService());

  // Register FilePickerViewModel
  getIt.registerFactory(() => FilePickerViewModel(getIt<FilePickerService>()));
}
