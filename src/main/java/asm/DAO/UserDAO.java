package asm.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;


import asm.entity.User;
import asm.jpa.jpaUtils;

public class UserDAO  extends AbstractEntityDAO<User>{

	public UserDAO() {
		super(User.class);
	}
	

	
}
