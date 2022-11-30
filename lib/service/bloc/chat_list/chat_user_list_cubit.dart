import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_user_list_state.dart';

class ChatUserListCubit extends Cubit<ChatUserListState> {
  ChatUserListCubit() : super(ChatUserListInitial());
}
