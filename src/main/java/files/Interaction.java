package files;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import frame.DB_Input;

public class Interaction
{

    public void addEntry(DB_Input entry){

        //Add Data to database
        Session session = UtilHibernate.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(entry);
        session.getTransaction().commit();
    }

    public boolean alreadyExists(DB_Input entry){

        Session session = UtilHibernate.getSessionFactory().openSession();
        session.beginTransaction();

        Query query = session.createQuery("select 1 from DB_Input where serialno=:serialId and appId=:appId");

        query.setParameter("serialId",entry.getSerialNo());
        query.setParameter("appId",entry.getAppId());

        List rowsFound = query.list();
        session.getTransaction().commit();

        if(rowsFound.size() != 0){
            return true;
        }
        return false;
    }


}
