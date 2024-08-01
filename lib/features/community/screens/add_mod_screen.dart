import 'package:discuss_it/core/common/error_text.dart';
import 'package:discuss_it/core/common/loader.dart';
import 'package:discuss_it/features/auth/controller/auth_controller.dart';
import 'package:discuss_it/features/community/controller/community_controller.dart';
import 'package:discuss_it/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddModScreen extends ConsumerStatefulWidget {
  final String name;

  const AddModScreen({
    super.key,
    required this.name,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddModScreenState();
}

class _AddModScreenState extends ConsumerState<AddModScreen> {
  Set<String> uids = {};
  int ctr = 0;

  void addUid(String uid) {
    setState(() {
      uids.add(uid);
    });
  }

  void removeUid(String uid) {
    setState(() {
      uids.remove(uid);
    });
  }

  void saveMods() {
    ref
        .read(communityControllerProvider.notifier)
        .addMods(widget.name, uids.toList(), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Moderators',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.deepOrange,
          ),
        ),
        actions: [
          IconButton(
            onPressed: saveMods,
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Responsive(
        child: ref.watch(getCommunityByNameProvider(widget.name)).when(
            data: (community) => ListView.builder(
                  itemCount: community.members.length,
                  itemBuilder: (BuildContext context, int index) {
                    final member = community.members[index];

                    return ref.watch(getUserDataProvider(member)).when(
                        data: (user) {
                          if (community.mods.contains(member) && ctr == 0) {
                            uids.add(member);
                          }
                          ctr++;
                          return CheckboxListTile(
                            value: uids.contains(user.uid),
                            onChanged: (val) {
                              if (val!) {
                                addUid(user.uid);
                              } else {
                                removeUid(user.uid);
                              }
                            },
                            title: Text(user.name),
                            activeColor: Colors.orange,
                          );
                        },
                        error: (error, stackTrace) =>
                            ErrorText(error: error.toString()),
                        loading: () => const Loader());
                  },
                ),
            error: (error, stackTrace) => ErrorText(error: error.toString()),
            loading: () => const Loader()),
      ),
    );
  }
}
