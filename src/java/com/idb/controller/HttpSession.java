package com.idb.controller;

import com.idb.model.Users;

public interface HttpSession {

	void setAttribute(String string, Users users);

	void setAttribute(String string, String u_name);

	void invalidate();

}
