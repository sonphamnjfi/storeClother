package entity;

public class cart {

    private String username;
    private long total;

    public cart() {
    }

    public cart(String username, long total) {
        this.username = username;
        this.total = total;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "cart{" +
                "username='" + username + '\'' +
                ", total=" + total +
                '}';
    }
}
