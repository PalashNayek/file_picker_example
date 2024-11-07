import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../di/service_locator.dart';
import '../view_models/file_picker_view_model.dart';

class FilePickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<FilePickerViewModel>(),
      child: Scaffold(
        appBar: AppBar(title: Text('File Picker Example')),
        body: FilePickerView(),
      ),
    );
  }
}

class FilePickerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FilePickerViewModel>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await viewModel.pickFile();
            },
            child: Text('Pick File'),
          ),
          if (viewModel.selectedFile != null)
            Text('Selected File: ${viewModel.selectedFile?.files.first.name}'),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await viewModel.pickMultipleFiles();
            },
            child: Text('Pick Multiple Files'),
          ),
          if (viewModel.selectedFile != null && viewModel.selectedFile!.files.length > 1)
            Text('Selected Files: ${viewModel.selectedFile!.files.map((f) => f.name).join(", ")}'),
        ],
      ),
    );
  }
}
