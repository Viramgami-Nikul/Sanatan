import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santvani_app/views/home/widget/home_post_widget.dart';

class TabNavigationCubit extends Cubit<int> {
  TabNavigationCubit() : super(0);

  PostData? sharedPost;

  void updateTab(final int index, {final PostData? post}) {
    sharedPost = post;
    emit(index);
  }

  void clearSharedPost() {
    sharedPost = null;
  }
}
