package com.sinosoft.msas.services;

import org.apache.axis2.AxisFault;
import org.apache.axis2.ServiceObjectSupplier;
import org.apache.axis2.description.AxisService;
import org.apache.axis2.description.Parameter;
import org.apache.axis2.extensions.spring.receivers.ApplicationContextHolder;
import org.apache.axis2.i18n.Messages;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class MPlatWebService implements ServiceObjectSupplier, ApplicationContextAware {
	private ApplicationContext applicationContext;

	public Object getServiceObject(AxisService axisService) throws AxisFault {
		Parameter springBeanName = axisService.getParameter("SpringBeanName");
		String beanName = ((String) springBeanName.getValue()).trim();
		if (beanName != null) {
			//注入applicationContext,
			applicationContext = ApplicationContextHolder.getContext();
			if (applicationContext == null)
				throw new AxisFault("applicationContext is NULL! ");
			if (applicationContext.getBean(beanName) == null)
				throw new AxisFault("Axis2 Can't find Spring Bean: " + beanName);
			return applicationContext.getBean(beanName);
		} else {
			throw new AxisFault(Messages.getMessage("paramIsNotSpecified", "SERVICE_SPRING_BEANNAME"));
		}

	}

	@Override
	public void setApplicationContext(ApplicationContext ctx)
			throws BeansException {
		this.applicationContext = ctx;
	}
}

