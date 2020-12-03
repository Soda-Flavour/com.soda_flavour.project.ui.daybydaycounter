import 'package:day_by_day_counter/model/project_config.model.dart';
import 'package:get/get.dart';

class ProjectConfigCtrl extends GetxController {
  Rx<ProjectConfigModel> _projectConfigModel =
      new ProjectConfigModel(null, null, null).obs;

  ProjectConfigModel get projectConfigModel => this._projectConfigModel.value;
  set projectConfigModel(ProjectConfigModel value) =>
      this._projectConfigModel.value = value;

  static ProjectConfigCtrl get to => Get.find();

  void setConfig(String mod, String iosMobKey, String androidMobKey) {
    projectConfigModel = new ProjectConfigModel(mod, iosMobKey, androidMobKey);
  }
}
