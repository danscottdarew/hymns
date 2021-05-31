import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:catholic_classics_hymns/model/hymn.dart';
import 'package:catholic_classics_hymns/model/hymn_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'hymn_event.dart';
part 'hymn_state.dart';

class HymnBloc extends Bloc<HymnEvent, HymnState> {
  HymnRepo repo;

  HymnBloc(this.repo);

  @override
  Stream<HymnState> mapEventToState(
    HymnEvent event,
  ) async* {
    if(event is SearchClickedEvent)
      yield HymnSearching();

    if(event is GetHymn){
      try{
          final hymns = await repo.fetchHymn(event.input);
          if(hymns != null)
            yield HymnFound(hymns);
      }
      on Error{
        yield HymnNotFound('Hymn Not Found');
      }
    }

    if(event is ScrollUpEvent){
      yield HymnScrolledUp(event.hymnIndex);
    }

    if(event is ScrollDownEvent){
      yield HymnScrolledDown(event.hymnIndex);
    }
  }

  @override
  // TODO: implement initialState
  HymnState get initialState => HymnInitial();
}