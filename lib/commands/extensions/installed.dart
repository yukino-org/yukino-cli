import 'package:args/command_runner.dart';
import 'package:extensions/metadata.dart';
import './_utils.dart';
import '../../core/extensions.dart';
import '../../core/manager.dart';
import '../../utils/console.dart';

class InstalledExtensionsCommand extends Command<void> {
  InstalledExtensionsCommand();

  @override
  final String name = 'installed';

  @override
  final List<String> aliases = <String>['list'];

  @override
  final String description = 'Display all the installed extensions.';

  @override
  Future<void> run() async {
    if (AppManager.isJsonMode) {
      printJson(
        ExtensionsManager.repository.extensions.values
            .map((final EStoreMetadata x) => x.toJson())
            .toList(),
      );
      return;
    }

    printTitle('Available Extensions');

    int i = 1;
    for (final EStoreMetadata x
        in ExtensionsManager.repository.extensions.values) {
      print('$i. ${dyeStoreMetadata(x)}');

      i++;
    }
  }
}
