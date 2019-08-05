import 'package:flutter/material.dart';
import '../../constants.dart' show AppColors;

enum Device { MAC, WIN }

class Conversation {
  const Conversation({
    @required this.title,
    @required this.avatar,
    this.titleColor: AppColors.TitleTextColor,
    this.desc,
    @required this.updateAt,
    this.isMute: false,
    this.unReadMsgCount: 0,
    this.displayDot: false,
  })  : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);

  final String avatar;
  final String title;
  final int titleColor;
  final String desc;
  final String updateAt;
  final bool isMute;
  final int unReadMsgCount;
  final bool displayDot;

  bool isAvatarFromNet() {
    if (this.avatar.startsWith('http') || this.avatar.startsWith('https')) {
      return true;
    }
    return false;
  }
}

class ConversationPageData {
  ConversationPageData({
    this.device,
    this.conversations,
  });

  final Device device;
  final List<Conversation> conversations;

  static mock() {
    return ConversationPageData(
        device: Device.WIN, conversations: mockConversations);
  }

  static List<Conversation> mockConversations = [
    const Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      desc: '',
      updateAt: '19:56',
    ),
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      desc: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      desc: '25元现金助力开学季！',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      desc: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 99,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      desc: '',
      updateAt: '19:56',
    ),
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      desc: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      desc: '25元现金助力开学季！',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      desc: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 99,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'assets/images/ic_file_transfer.png',
      title: '文件传输助手',
      desc: '',
      updateAt: '19:56',
    ),
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      desc: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '17:20',
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      titleColor: 0xff586b95,
      desc: '25元现金助力开学季！',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'assets/images/ic_fengchao.png',
      title: '蜂巢智能柜',
      titleColor: 0xff586b95,
      desc: '喷一喷，竟比洗牙还神奇！5秒钟还你一个漂亮洁白的口腔。',
      updateAt: '17:12',
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 99,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 3,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
      title: '汤姆丁',
      desc: '今晚要一起去吃肯德基吗？',
      updateAt: '17:56',
      isMute: true,
      unReadMsgCount: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
      title: 'Tina Morgan',
      desc: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
      updateAt: '17:58',
      isMute: false,
      unReadMsgCount: 1,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/56.jpg',
      title: 'Lily',
      desc: '今天要去运动场锻炼吗？',
      updateAt: '昨天',
      isMute: false,
      unReadMsgCount: 0,
    ),
  ];
}
