import 'package:hive/hive.dart';

import '../../components/constants.dart';

// ignore: avoid_classes_with_only_static_members
class AppBox {
 static Box box = Hive.box(boxName);
}
