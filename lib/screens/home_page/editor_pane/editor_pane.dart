import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:apidash/providers/providers.dart';
import 'package:apidash/consts.dart';
import 'details_card/details_card.dart';
import 'url_card.dart';

class RequestEditorPane extends ConsumerStatefulWidget {
  const RequestEditorPane({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<RequestEditorPane> createState() => _RequestEditorPaneState();
}

class _RequestEditorPaneState extends ConsumerState<RequestEditorPane> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activeId = ref.watch(activeIdStateProvider);
    if (activeId == null) {
      return const RequestEditorPaneHome();
    } else {
      return Padding(
        padding: kP8,
        child: Column(
          children: const [
            EditorPaneRequestURLCard(),
            kVSpacer10,
            Expanded(
              child: EditorPaneRequestDetailsCard(),
            ),
          ],
        ),
      );
    }
  }
}

class RequestEditorPaneHome extends ConsumerWidget {
  const RequestEditorPaneHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 60,
      ),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Welcome to API Dash ⚡️",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
          kVSpacer20,
          Row(
            children: [
              Expanded(
                child: Text(
                  kIntro,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          kVSpacer10,
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Please support this project by giving us a ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: FilledButton.icon(
                          onPressed: () {
                            launchUrl(Uri.parse(kGitUrl));
                          },
                          icon: const Icon(Icons.star),
                          label: const Text(
                            'Star on GitHub',
                            style: kTextStyleButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          kVSpacer20,
          Row(
            children: [
              Expanded(
                child: Text(
                  "Getting Started",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          kVSpacer20,
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Click on the ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: ElevatedButton(
                          onPressed: () {
                            String newId = ref
                                .read(collectionStateNotifierProvider.notifier)
                                .add();
                            ref
                                .read(activeIdStateProvider.notifier)
                                .update((state) => newId);
                          },
                          child: const Text(
                            '+ New',
                            style: kTextStyleButton,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: " button to start drafting a new API request.",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          kVSpacer10,
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Choose your theme now: ",
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await ref.read(darkModeProvider.notifier).toggle();
                        },
                        icon: isDarkMode
                            ? const Icon(Icons.dark_mode)
                            : const Icon(Icons.light_mode),
                        label: Text(
                          isDarkMode ? "Dark" : "Light",
                          style: kTextStyleButton,
                        ),
                      ),
                    ),
                  ],
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          kVSpacer20,
          kVSpacer10,
          Row(
            children: [
              Expanded(
                child: Text(
                  "Support Channel",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          kVSpacer20,
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Join our ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: FilledButton.icon(
                          onPressed: () {
                            launchUrl(Uri.parse(kDiscordUrl));
                          },
                          icon: const Icon(Icons.discord),
                          label: const Text(
                            'Discord Server',
                            style: kTextStyleButton,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: " and drop a message in the #foss channel.",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          kVSpacer20,
          kVSpacer10,
          Row(
            children: [
              Expanded(
                child: Text(
                  "Report Bug / Request New Feature",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
          kVSpacer20,
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Just raise an issue in our ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: FilledButton.icon(
                          onPressed: () {
                            launchUrl(Uri.parse(kGitUrl));
                          },
                          icon: const Icon(Icons.code_rounded),
                          label: const Text(
                            'Github Repo',
                            style: kTextStyleButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
