package com.forbes.hibernate.dao;

import java.util.Calendar;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import com.forbes.hibernate.basedao.BaseUserAccountDAO;
import com.forbes.hibernate.bean.UserAccount;
import com.forbes.hibernate.bean.UserScoreLog;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserAccount entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.forbes.hibernate.UserAccount
 * @author MyEclipse Persistence Tools
 */

public class UserAccountDAO extends BaseUserAccountDAO {
	private static final Log log = LogFactory.getLog(UserAccountDAO.class);
	// property constants
	
	 /**
     * 初始账户
     * @param userId
     * @param initAmt
     */
    public UserAccount initAccount(String userId, int initAmt, short accountType){
    	try {
    		UserAccount account = new UserAccount();
    		account.setBalance(0);
    		account.setPresentBalance(initAmt);
    		account.setUserId( new Long(userId) );
    		account.setAccountType( accountType );
    		getSession().save(account);
            
            UserScoreLog log = new UserScoreLog();
			log.setAmount( 0 );
			log.setBalance( 0 );
			log.setPresentAmount(initAmt);
			log.setPresentBalance( initAmt );
			log.setStatus((short)1);
			log.setGenDate( Calendar.getInstance().getTime() );
			log.setRemark( "系统赠送" );
			log.setUserId( new Long(userId) );
			getSession().save( log );
            return account;
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
	
	public List findByUserIdAndType(String userId, String  accountType) {
        try {
        	String queryString = "from UserAccount as model where model.userId = ? and model.accountType = ? " ;
        	org.hibernate.Query query = getSession().createQuery(queryString);
        	//System.out.println("queryString = " + queryString);
			query.setParameter(0, userId );
			query.setParameter(1, accountType );
	
			return query.list();
        } catch (RuntimeException re) {
           log.error("find by property name failed", re);
           throw re;
        }
  	}
	
	public List findByUserAndAccount( String  accountType) {
        try {
        	String queryString = "SELECT user, account from UserAccount as account, UcMembers as user " +
        			" where account.accountType = ? and account.userId = user.uid ORDER by (account.balance + account.presentBalance ) DESC " ;
        	org.hibernate.Query query = getSession().createQuery(queryString);
        	//System.out.println("queryString = " + queryString);	
			query.setParameter(0, accountType );
	
			return query.list();
        } catch (RuntimeException re) {
           log.error("find by property name failed", re);
           throw re;
        }
  	}
	
}