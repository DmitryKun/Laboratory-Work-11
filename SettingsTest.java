public class SettingsTest {
    private String status;

    public int changeStatus(String userID, String newStatus) {
        if (userID == null || userID.isEmpty()) {
            return -1;
        }

        if (!newStatus.equals("online") && !newStatus.equals("offline")) {
            return -2;
        }

        if (newStatus.equals("online")) {
            this.status = "online";
            System.out.println("Status changed to online for user with ID: " + userID);
        } else {
            this.status = "offline";
            System.out.println("Status changed to offline for user with ID: " + userID);
        }

        return 1;
    }

    public String getStatus() {
        return status;
    }

    public void SettingsTest(){
        return status;
    }
}
