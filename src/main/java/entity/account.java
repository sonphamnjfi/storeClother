package entity;

public class account {
    private String us;
    private String pass;
    private int idsell;
    private int idadmin;

    public account() {
    }

    public account(String us, String pass, int idsell, int idadmin) {
        this.us = us;
        this.pass = pass;
        this.idsell = idsell;
        this.idadmin = idadmin;
    }

    public String getUs() {
        return us;
    }

    public void setUs(String us) {
        this.us = us;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIdsell() {
        return idsell;
    }

    public void setIdsell(int idsell) {
        this.idsell = idsell;
    }

    public int getIdadmin() {
        return idadmin;
    }

    public void setIdadmin(int idadmin) {
        this.idadmin = idadmin;
    }

    @Override
    public String toString() {
        return "account{" +
                "us='" + us + '\'' +
                ", pass='" + pass + '\'' +
                ", idsell=" + idsell +
                ", idadmin=" + idadmin +
                '}';
    }
}
