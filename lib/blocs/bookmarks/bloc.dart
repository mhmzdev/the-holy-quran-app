import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/al_quran_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';
part 'state.dart';

class BookmarksBloc extends Bloc<BookmarksEvent, BookmarkState> {
  BookmarksBloc({required BookmarksRepo repo})
      : _repo = repo,
        super(const BookmarkDefault()) {
    on<BookmarksFetch>(_onBookmarksFetch);
    on<UpdateBookmark>(_onUpdateBookmark);
    on<CheckBookmark>(_onCheckBookmark);
  }

  final BookmarksRepo _repo;

  void _onBookmarksFetch(
    BookmarksFetch event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(const BookmarkFetchLoading());

    try {
      final data = await _repo.fetchBookmarks();
      emit(BookmarkFetchSuccess(data: data));
    } catch (e) {
      emit(BookmarkFetchFailed(message: e.toString()));
    }
  }

  void _onUpdateBookmark(
    UpdateBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(const BookmarkFetchLoading());

    try {
      List<Chapter?>? data = [];

      if (event.add) {
        data = await _repo.addBookmark(event.chapter);
      } else {
        data = await _repo.removeBookmark(event.chapter);
      }
      emit(BookmarkFetchSuccess(data: data, isBookmarked: event.add));
    } catch (e) {
      emit(BookmarkFetchFailed(message: e.toString()));
    }
  }

  void _onCheckBookmark(
    CheckBookmark event,
    Emitter<BookmarkState> emit,
  ) async {
    emit(const BookmarkFetchLoading());

    try {
      final isBookmarked = await _repo.checkBookmarked(event.chapter);
      final data = await _repo.fetchBookmarks();
      emit(BookmarkFetchSuccess(data: data, isBookmarked: isBookmarked));
    } catch (e) {
      emit(BookmarkFetchFailed(message: e.toString()));
    }
  }
}
