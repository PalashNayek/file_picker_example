import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../services/file_picker_service.dart';

class FilePickerViewModel extends ChangeNotifier {
  final FilePickerService _filePickerService;

  FilePickerResult? _selectedFile;
  FilePickerResult? get selectedFile => _selectedFile;

  FilePickerViewModel(this._filePickerService);

  Future<void> pickFile() async {
    _selectedFile = await _filePickerService.pickFile();
    notifyListeners();
  }

  Future<void> pickMultipleFiles() async {
    _selectedFile = await _filePickerService.pickMultipleFiles();
    notifyListeners();
  }
}
