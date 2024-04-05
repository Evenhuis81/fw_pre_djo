// 1. remove Statistic for engine and showStatistics method in Engine class
//

class Engine {
    ArrayList<Update> updates, updatesToAdd, updatesToRemove;
    ArrayList<Show> shows, showsToAdd, showsToRemove;
    boolean updatesOrShowsToAddOrRemove;

    Engine() {
        updates = new ArrayList<Update>();
        updatesToAdd = new ArrayList<Show>();
        updatesToRemove = new ArrayList<Show>();
        shows = new ArrayList<Show>();
        showsToAdd = new ArrayList<Show>();
        showsToRemove = new ArrayList<Show>();
        updatesOrShowsToAddOrRemove = false;
    }

    void add(Update update) {
        updatesToAdd.add(update);

        updatesOrShowsToAddOrRemove = true;
    }

    void add(Update[] updates) {
        updatesToAdd.addAll(Arrays.asList(updates));

        updatesOrShowsToAddOrRemove = true;
    }

    void remove(Update update) {
        updatesToRemove.add(update);

        updatesOrShowsToAddOrRemove = true;
    }

    void remove(Update[] updates) {
        updatesToRemove.addAll(Arrays.asList(updates));

        updatesOrShowsToAddOrRemove = true;
    }

    void add(Show show) {
        showsToAdd.add(show);

        updatesOrShowsToAddOrRemove = true;
    }

    void add(Show[] shows) {
        showsToAdd.addAll(Arrays.asList(shows));

        updatesOrShowsToAddOrRemove = true;
    }

    void remove(Show show) {
        showsToRemove.add(show);

        updatesOrShowsToAddOrRemove = true;
    }

    void update() {
        for (Update u : updates) u.update();

        if (updatesOrShowsToAddOrRemove) {
            shows.addAll(showsToAdd);
            shows.removeAll(showsToRemove);

            showsToAdd.clear();
            showsToRemove.clear();
            
            updates.addAll(updatesToAdd);
            updates.removeAll(updatesToRemove);

            updatesToAdd.clear();
            updatesToRemove.clear();

            updatesOrShowsToAddOrRemove = false;
        }
    }

    void draw() {
        for (Show s : shows) s.show();
    }
}
