package com.fairytown.ft.chat.store.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fairytown.ft.chat.domain.vo.ChatVO;
import com.fairytown.ft.chat.store.ChatStore;

@Repository
public class ChatStoreImpl implements ChatStore {

	@Override
	public ChatVO selectChatId(SqlSession session, String userId) {
		ChatVO chat = session.selectOne("ChatMapper.selectChatId", userId);
		return chat;
	}

	@Override
	public void insertChatRoom(SqlSession session, ChatVO newChat) {
		session.insert("ChatMapper.insertChatRoom", newChat);
	}

	@Override
	public int insertaddMsg(SqlSession session, ChatVO chat) {
		int result = session.insert("ChatMapper.insertaddMsg", chat);
		return result;
	}

	@Override
	public List<ChatVO> selectMsgByChatId(SqlSession session, String chatUserId) {
		List<ChatVO> msgList = session.selectList("ChatMapper.selectMsgByChatId", chatUserId);
		return msgList;
	}

	


}
