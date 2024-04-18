//pharmacy
abstract class ChatsStates {}

class ChatsInitialState extends ChatsStates {}

class GetChatsLoadingState extends ChatsStates {}
class GetChatsSuccessState extends ChatsStates {
}
class GetChatsErrorState extends ChatsStates {
  var error;

  GetChatsErrorState(this.error);
}


class SendChatsLoadingState extends ChatsStates {}
class SendChatsSuccessState extends ChatsStates {
}
class SendChatsErrorState extends ChatsStates {
  var error;

  SendChatsErrorState(this.error);
}

class contactsLoadingState extends ChatsStates {}
class contactsSuccessState extends ChatsStates {
}
class contactsErrorState extends ChatsStates {
  var error;

  contactsErrorState(this.error);
}