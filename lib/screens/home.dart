import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_project/bloc/git_bloc.dart';
import 'package:git_project/widgets/app_textfield.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocBuilder<GitBloc, GitState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff141c2f),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'devfinder',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: searchController,
                            hintText: 'Search GitHub username...',
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xff096ada),
                              size: 30,
                            ),
                            trailingWidget: GestureDetector(
                              onTap: () {
                                context.read<GitBloc>().add(GitSearch(
                                    searchQuery: searchController.text));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: 50,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff0079fe),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Search',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (state.status == GitStatus.fetching)
                      const SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (state.gitData != null) ...[
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1f2a48),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    child: ClipOval(
                                        child: Image.network(
                                      state.gitData!.avatarUrl,
                                    )),
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.gitData!.login,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      state.gitData!.name != null
                                          ? const SizedBox(height: 3)
                                          : const SizedBox(),
                                      state.gitData!.name != null
                                          ? Text(
                                              state.gitData!.name ?? '',
                                              style: const TextStyle(
                                                color: Color(0xff096ada),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : const SizedBox(),
                                      state.gitData!.createdAt != null
                                          ? const SizedBox(height: 3)
                                          : const SizedBox(),
                                      Text(
                                        state.gitData!.createdAt != null
                                            ? 'Joined ${DateFormat('dd MMM yyyy').format(
                                                DateTime.parse(
                                                    state.gitData!.createdAt ??
                                                        ''),
                                              )}'
                                            : '',
                                        style: const TextStyle(
                                          color: Color(0xffd2dae5),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              state.gitData!.bio != null
                                  ? const SizedBox(height: 30)
                                  : const SizedBox(),
                              state.gitData!.bio != null
                                  ? Text(
                                      state.gitData!.bio ?? '',
                                      style: const TextStyle(
                                        color: Color(0xffd2dae5),
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(height: 20),
                              Container(
                                height: 90,
                                decoration: BoxDecoration(
                                  color: const Color(0xff141c2f),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Repos',
                                            style: TextStyle(
                                                color: Color(0xffd2dae5)),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            state.gitData!.publicRepos
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Followers',
                                            style: TextStyle(
                                              color: Color(0xffd2dae5),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            state.gitData!.followers.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Following',
                                            style: TextStyle(
                                              color: Color(0xffd2dae5),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            state.gitData!.following.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              state.gitData!.location != null
                                  ? const SizedBox(height: 20)
                                  : const SizedBox(),
                              state.gitData!.location != null
                                  ? Row(
                                      children: [
                                        const Icon(
                                          Ionicons.location_sharp,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          state.gitData!.location ?? '',
                                          style: const TextStyle(
                                            color: Color(0xffd2dae5),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              state.gitData!.blog!.isNotEmpty
                                  ? const SizedBox(height: 10)
                                  : const SizedBox(),
                              state.gitData!.blog!.isNotEmpty
                                  ? Row(
                                      children: [
                                        const Icon(
                                          Icons.link,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          state.gitData!.blog ?? '',
                                          style: const TextStyle(
                                            color: Color(0xffd2dae5),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                              state.gitData!.location != null &&
                                      state.gitData!.blog != null
                                  ? const SizedBox(height: 10)
                                  : const SizedBox(
                                      height: 20,
                                    ),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Color(0xff8c93a6),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    state.gitData!.twitterUsername ??
                                        'Not Available',
                                    style: const TextStyle(
                                      color: Color(0xff8c93a6),
                                    ),
                                  ),
                                ],
                              ),
                              state.gitData!.company != null &&
                                      state.gitData!.company!.isNotEmpty
                                  ? const SizedBox(height: 15)
                                  : const SizedBox(),
                              state.gitData!.company != null &&
                                      state.gitData!.company!.isNotEmpty
                                  ? Row(
                                      children: [
                                        const Icon(
                                          Icons.cabin,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          state.gitData!.company ?? '',
                                          style: const TextStyle(
                                            color: Color(0xffd2dae5),
                                          ),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
