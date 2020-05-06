package ua.nure.kuzmin.SummaryTask4.db.entity;
/**
 * Category entity.
 *
 * @author V.Kuzmin
 *
 */
public class Category extends Entity {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Category [name=" + name + ", Id=" + getId() + "]";
    }

}
