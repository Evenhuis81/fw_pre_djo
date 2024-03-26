class Engine {
    ArrayList<Update> updates, updatesToAdd, updatesToRemove;
    ArrayList<Show> shows, showsToAdd, showsToRemove;

    Engine() {
        updates = new ArrayList<Update>();
        updatesToRemove = new ArrayList<Update>();
        updatesToAdd = new ArrayList<Update>();
        shows = new ArrayList<Show>();
        showsToRemove = new ArrayList<Show>();
        showsToAdd = new ArrayList<Show>();
    }

    void addUpdate(Update update) {
        updatesToAdd.add(update);
    }

    void addUpdate(Update[] updates) {
        updatesToAdd.addAll(Arrays.asList(updates));
    }

    void removeUpdate(Update update) {
        updatesToRemove.add(update);
    }

    void addShow(Show show) {
        showsToAdd.add(show);
    }

    void addShow(Show[] shows) {
        showsToAdd.addAll(Arrays.asList(shows));
    }

    void removeShow(Show show) {
        showsToRemove.add(show);
    }

    void update() {
        for (Update u : updates) u.update();

        updates.addAll(updatesToAdd);
        updates.removeAll(updatesToRemove);

        updatesToAdd.clear();
        updatesToRemove.clear();
    }

    void draw() {
        for (Show s : shows) s.show();

        shows.addAll(showsToAdd);
        shows.removeAll(showsToRemove);

        showsToAdd.clear();
        showsToRemove.clear();
    }

    void showStatistics() {
        textAlign(LEFT, TOP);
        textSize(26);
        fill(255);
        text("Shows:   " + shows.size(), 0, 30);
        text("Updates: " + updates.size(), 0, 60);
    }
}
