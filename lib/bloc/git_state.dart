part of 'git_bloc.dart';

enum GitStatus {
  initial,
  fetching,
  fetched,
  exception;
}

class GitState {
  final GitStatus status;
  final GitModel? gitData;

  GitState({
    required this.status,
    this.gitData,
  });

  factory GitState.initial() {
    return GitState(status: GitStatus.initial);
  }

  GitState copyWith({
    required GitStatus status,
    GitModel? gitData,
  }) {
    return GitState(
      status: status,
      gitData:gitData??this.gitData,
    );
  }
}
