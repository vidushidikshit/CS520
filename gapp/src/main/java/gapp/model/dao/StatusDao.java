package gapp.model.dao;

import gapp.model.ApplicationStatus;


public interface StatusDao {

	ApplicationStatus getStatusById(Integer Id);

}