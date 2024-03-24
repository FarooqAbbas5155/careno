import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class PickedImageData {
  final String name;
  final String path;
  final String fileType;

  PickedImageData(this.name, this.path, this.fileType);
}

class FilePick{
  static String getFileType(String fileName) {
    return fileName.split('.').last.toLowerCase();
  }
  Future<PickedImageData?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: false, // Ensure only one file is selected
          type: FileType.any
      );
      if (result == null || result.files.isEmpty) return null;
      if (result != null) {
        var files= result.files.single;
        final name = files.name;
        final path = files.path;
        final fileType = getFileType(name);
        return PickedImageData(name, path!, fileType);
      }
    } catch (e) {
      Get.snackbar("Alert", e.toString());
    }
  }
  Future<String> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile == null) {
        print("User canceled the picker");
        return "User canceled the picker"; // User canceled the picker
      }
      return pickedFile.path;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

}