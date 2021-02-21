import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

final loggerProvider = Provider((_) => SimpleLogger());
