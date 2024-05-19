package com.devpro.javawebDATN.services;

import com.devpro.javawebDATN.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
