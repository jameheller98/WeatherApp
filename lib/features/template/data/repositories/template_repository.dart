import 'package:core_flutter_bloc/features/template/data/data_sources/data_sources.dart';

abstract class TemplateRepository {}

class TemplateRepositoryImpl implements TemplateRepository {
  final TemplateDataSource templateDataSource;

  const TemplateRepositoryImpl({required this.templateDataSource});
}
