import 'package:bloc/bloc.dart';
import 'package:git_project/model/git_model.dart';
import 'package:git_project/network/base_result.dart';
import 'package:git_project/repo/git_repo.dart';

part 'git_event.dart';
part 'git_state.dart';

class GitBloc extends Bloc<GitEvent, GitState> {
  GitBloc() : super(GitState.initial()) {
    on<GitSearch>(gitSearch);
  }

  GitRepo gitRepo = GitRepo();

  Future<void> gitSearch(
    GitSearch event,
    Emitter<GitState> emit,
  ) async {
    emit(state.copyWith(status: GitStatus.fetching));

    try {
      final Result response = await gitRepo.gitRepo(event.searchQuery);
      if (response.success ?? false) {
        emit(state.copyWith(status: GitStatus.fetched,gitData: response.data));
      } else {
        emit(state.copyWith(status: GitStatus.exception));
      }
    } catch (e) {
      emit(state.copyWith(status: GitStatus.exception));
    }
  }
}
