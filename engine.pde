class Engine {
    ArrayList<Update> updates, updatesToRemove;
    ArrayList<Show> shows, showsToRemove;;

    Engine() {
        updates = new ArrayList<Update>();
        updatesToRemove = new ArrayList<Update>();
        shows = new ArrayList<Show>();
        showsToRemove = new ArrayList<Show>();
    }

    void addUpdate(Update update) {
        updates.add(update);
    }

    void removeUpdate(Update update) {
        updatesToRemove.remove(update);
    }

    void addShow(Show show) {
        shows.add(show);
    }

    void removeShow(Show show) {
        showsToRemove.remove(show);
    }

    void update() {
        for (Update u : updates) u.update();

        updates.removeAll(updatesToRemove);

        updatesToRemove.clear();
    }

    void draw() {
        for (Show s : shows) s.show();

        shows.removeAll(showsToRemove);

        showsToRemove.clear();
    }
}