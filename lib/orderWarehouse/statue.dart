abstract class OrderWarehouseStates {}

class OrderWarehouseInitialState extends OrderWarehouseStates {}

class OrderWarehouseLoadingState extends OrderWarehouseStates {

}
class OrderWarehouseSuccessState extends OrderWarehouseStates {

  var value;
  OrderWarehouseSuccessState(this.value);

}
class OrderWarehouseErrorState extends OrderWarehouseStates {
  var error;

  OrderWarehouseErrorState(this.error);
}



class DetailsLoadingState extends OrderWarehouseStates {

}
class DetailsWarehouseSuccessState extends OrderWarehouseStates {

  var value;
  DetailsWarehouseSuccessState(this.value);

}
class DetailsWarehouseErrorState extends OrderWarehouseStates {
  var error;

  DetailsWarehouseErrorState(this.error);
}



class InvoiceLoadingState extends OrderWarehouseStates {

}
class InvoiceWarehouseSuccessState extends OrderWarehouseStates {

  var value;
  InvoiceWarehouseSuccessState(this.value);

}
class InvoiceWarehouseErrorState extends OrderWarehouseStates {
  var error;

  InvoiceWarehouseErrorState(this.error);
}

class InvoicesShowWarehouseLoadingState extends OrderWarehouseStates {

}
class InvoicesShowWarehouseSuccessState extends OrderWarehouseStates {

  var value;
  InvoicesShowWarehouseSuccessState(this.value);

}
class InvoicesShowWarehouseErrorState extends OrderWarehouseStates {
  var error;

  InvoicesShowWarehouseErrorState(this.error);
}



class InvoicesDetailsWarehouseLoadingState extends OrderWarehouseStates {

}
class InvoicesDetailsWarehouseSuccessState extends OrderWarehouseStates {

  var value;
  InvoicesDetailsWarehouseSuccessState(this.value);

}
class InvoicesDetailsWarehouseErrorState extends OrderWarehouseStates {
  var error;

  InvoicesDetailsWarehouseErrorState(this.error);
}


class qr_codeDetailsWarehouseLoadingState extends OrderWarehouseStates {

}
class qr_codeDetailsWarehouseSuccessState extends OrderWarehouseStates {

  var value;
  qr_codeDetailsWarehouseSuccessState(this.value);

}
class qr_codeDetailsWarehouseErrorState extends OrderWarehouseStates {
  var error;

  qr_codeDetailsWarehouseErrorState(this.error);
}