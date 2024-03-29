class Engine {
    ArrayList<Update> updates, updatesToAdd, updatesToRemove;
    ArrayList<Show> shows, showsToAdd, showsToRemove;
    boolean updatesReadyToAddOrRemove = false;
    boolean showsReadyToAddOrRemove = false;
    boolean updateResetDone = false;
    boolean showResetDone = false;
    boolean reset = false;

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

        updatesReadyToAddOrRemove = true;
    }

    void addUpdate(Update[] updates) {
        updatesToAdd.addAll(Arrays.asList(updates));

        updatesReadyToAddOrRemove = true;
    }

    void removeUpdate(Update update) {
        updatesToRemove.add(update);

        updatesReadyToAddOrRemove = true;
    }

    void addShow(Show show) {
        showsToAdd.add(show);

        showsReadyToAddOrRemove = true;
    }

    void addShow(Show[] shows) {
        showsToAdd.addAll(Arrays.asList(shows));

        showsReadyToAddOrRemove = true;
    }

    void removeShow(Show show) {
        showsToRemove.add(show);

        showsReadyToAddOrRemove = true;
    }

    void update() {
        for (Update u : updates) u.update();

        if (showsReadyToAddOrRemove) {
            updates.addAll(updatesToAdd);
            updates.removeAll(updatesToRemove);

            updatesToAdd.clear();
            updatesToRemove.clear();

            updatesReadyToAddOrRemove = false;
        }

        if (reset) {
            updates.clear();

            updateResetDone = true;
        }
    }

    void draw() {
        for (Show s : shows) s.show();

        if (showsReadyToAddOrRemove) {
            shows.addAll(showsToAdd);
            shows.removeAll(showsToRemove);

            showsToAdd.clear();
            showsToRemove.clear();

            showsReadyToAddOrRemove = false;
        }

        if (reset) {
            shows.clear();

            showResetDone = true;

            if (updateResetDone && showResetDone) {
                reset = false;

                screen.resetDone(); // make this a dynamic thing (send boolean through?)
            }
        }
    }

    void showStatistics() {
        textAlign(LEFT, TOP);
        textSize(26);
        fill(255);
        text("Shows:   " + shows.size(), 0, 30);
        text("Updates: " + updates.size(), 0, 60);
    }
}
