part of 'hymn_bloc.dart';

abstract class HymnEvent extends Equatable {
  const HymnEvent();

}
class SearchClickedEvent extends HymnEvent{
  const SearchClickedEvent();
  @override
  List<Object> get props => [];

}

class GetHymn extends HymnEvent{
  final String input;
   GetHymn(this.input){
    p('Input $input');
  }

  @override
  // TODO: implement props
  List<Object> get props => [input];

}

class HymnSelectedEvent extends HymnEvent{
  final Hymn hymn;

  const HymnSelectedEvent(this.hymn);
  @override
  // TODO: implement props
  List<Object> get props => [hymn];

}

class ScrollUpEvent extends HymnEvent{
  final int hymnIndex;
  const ScrollUpEvent(this.hymnIndex);
  @override
  List<Object> get props => [hymnIndex];

}

class ScrollDownEvent extends HymnEvent{
  final int hymnIndex;
  const ScrollDownEvent(this.hymnIndex);
  @override
  List<Object> get props => [hymnIndex];

}


