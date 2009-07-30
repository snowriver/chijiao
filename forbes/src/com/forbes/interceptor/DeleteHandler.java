package com.forbes.interceptor;

import org.hibernate.HibernateException;
import org.hibernate.event.DeleteEvent;
import org.hibernate.event.def.DefaultDeleteEventListener;
import com.forbes.interceptor.ModifiedObjectTracker;

@SuppressWarnings("serial")
public class DeleteHandler extends DefaultDeleteEventListener {
	private ModifiedObjectTracker tracker;

	@Override
	public void onDelete(DeleteEvent event) throws HibernateException {
		getModifiedObjectTracker().notifyModified(event.getEntityName());
	}

	public ModifiedObjectTracker getModifiedObjectTracker() {
		return tracker;
	}

	public void setModifiedObjectTracker(ModifiedObjectTracker tracker) {
		this.tracker = tracker;
	}
}
