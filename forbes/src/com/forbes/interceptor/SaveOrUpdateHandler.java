package com.forbes.interceptor;

import java.io.Serializable;

import org.hibernate.HibernateException;
import org.hibernate.event.SaveOrUpdateEvent;
import org.hibernate.event.SaveOrUpdateEventListener;
import com.forbes.interceptor.ModifiedObjectTracker;

@SuppressWarnings("serial")
public class SaveOrUpdateHandler implements SaveOrUpdateEventListener {
	
	private ModifiedObjectTracker tracker;

	public Serializable onSaveOrUpdate(SaveOrUpdateEvent event) throws HibernateException {
		getModifiedObjectTracker().notifyModified(event.getEntityName());
		return null;
	}
	
	public ModifiedObjectTracker getModifiedObjectTracker() {
		return tracker;
	}

	public void setModifiedObjectTracker(ModifiedObjectTracker tracker) {
		this.tracker = tracker;
	}
}
