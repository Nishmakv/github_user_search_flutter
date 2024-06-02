part of 'git_bloc.dart';

abstract class GitEvent {
  const GitEvent();
  List<Object?> get props => [];
}

class GitSearch extends GitEvent {
  final String searchQuery;
  const GitSearch({required this.searchQuery});
  @override
  List<Object?> get props => [];
}
