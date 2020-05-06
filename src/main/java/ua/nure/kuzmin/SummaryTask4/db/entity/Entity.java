package ua.nure.kuzmin.SummaryTask4.db.entity;

import java.io.Serializable;
/**
 * The root of all entities that have an identifier field.
 *
 * @author V.Kuzmin
 *
 */
public abstract class Entity implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
