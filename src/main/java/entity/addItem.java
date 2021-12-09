package entity;

public class addItem {

    private String username;
    private int PID;
    private int amount;

    public addItem() {
    }

    public addItem(String username, int PID, int amount) {
        this.username = username;
        this.PID = PID;
        this.amount = amount;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "addItem{" +
                "username='" + username + '\'' +
                ", PID=" + PID +
                ", amount=" + amount +
                '}';
    }
}
