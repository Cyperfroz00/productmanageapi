
abstract interface class BaseView{
  void onLoading();
  void onHiding();
  void onError(String message);
  void onSuccess(Object data);
}