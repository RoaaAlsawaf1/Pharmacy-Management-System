//pharmacy
abstract class MapStates {}

class MapInitialState extends MapStates {}

class MapSearchLoadingState extends MapStates {}
class MapSearchSuccessState extends MapStates {
}
class MapSearchErrorState extends MapStates {
  var error;

  MapSearchErrorState(this.error);
}


class MapNearbyLoadingState extends MapStates {}
class MapNearbySuccessState extends MapStates {
}
class MapNearbyErrorState extends MapStates {
  var error;

  MapNearbyErrorState(this.error);
}