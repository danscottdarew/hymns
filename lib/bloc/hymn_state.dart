part of 'hymn_bloc.dart';

abstract class HymnState extends Equatable {
  const HymnState();
}

class HymnInitial extends HymnState {
  const HymnInitial();
  @override
  List<Object> get props => [];

}

class HymnSearching extends HymnState{
  const HymnSearching();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class HymnFound extends HymnState{
  final List<Hymn> hymns;
  const HymnFound(this.hymns);

  @override
  // TODO: implement props
  List<Object> get props => [hymns];
}

class HymnSelected extends HymnState{
  final hymn;
  const HymnSelected(this.hymn);
  @override
  // TODO: implement props
  List<Object> get props => [hymn];
}

class HymnNotFound extends HymnState{
  final message;
  const HymnNotFound(this.message);

  @override
  List<Object> get props => [message];

}

class HymnScrolledUp extends HymnState{
  final int hymnIndex;
  const HymnScrolledUp(this.hymnIndex);
  @override
  // TODO: implement props
  List<Object> get props => [hymnIndex];

}

class HymnScrolledDown extends HymnState{
  final int hymnIndex;
  const HymnScrolledDown(this.hymnIndex);
  @override
  // TODO: implement props
  List<Object> get props => [hymnIndex];

}


class MenuItemHymnsViewed extends HymnState{
  const MenuItemHymnsViewed();
  @override
  // TODO: implement props
  List<Object> get props => [];

}


class MenuItemClassicsViewed extends HymnState{
  const MenuItemClassicsViewed();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class MenuItemTableOfContentsViewed extends HymnState{
  const MenuItemTableOfContentsViewed();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class MenuItemSolfaNotationViewed extends HymnState{
  const MenuItemSolfaNotationViewed();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class MenuItemAcknowledgementViewed extends HymnState{
  const MenuItemAcknowledgementViewed();
  @override
  // TODO: implement props
  List<Object> get props => [];

}