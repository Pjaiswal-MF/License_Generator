package frame;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity @Table(name = "/AppleLisc")

public class DB_Input
{
    private static final long serialVersionUID = -1798070786993154676L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", unique = true, nullable = false)
    private int id;

    @Column(name = "appid", nullable = false, length = 50)
    private String appId;

    @Column(name = "SerialNo", nullable = false, length = 100)
    private String serialno;

    @Column(name = "Status", nullable = false)
    private boolean status;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getSerialNo()
    {
        return serialno;
    }

    public void setSerialId(String serialNo)
    {
        this.serialno = serialNo;
    }

    public String getAppId()
    {
        return appId;
    }

    public void setAppId(String appId)
    {
        this.appId = appId;
    }

    public boolean isStatus()
    {
        return status;
    }

    public void setStatus(boolean status)
    {
        this.status = status;
    }
}
