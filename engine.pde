class Engine {
    ArrayList<Update> updates, updatesToAdd, updatesToRemove;
    ArrayList<Show> shows, showsToAdd, showsToRemove;
    ArrayList<AfterRemove> afterRemove;
    boolean addOrRemove, doReset;
    AfterReset afterReset;

    Engine() {
        updates = new ArrayList<Update>();
        updatesToAdd = new ArrayList<Update>();
        updatesToRemove = new ArrayList<Update>();
        shows = new ArrayList<Show>();
        showsToAdd = new ArrayList<Show>();
        showsToRemove = new ArrayList<Show>();
        afterRemove = new ArrayList<AfterRemove>();
        addOrRemove = false;
    }

    void reset(AfterReset afterReset) {
        this.afterReset = afterReset;

        doReset = true;
    }

    void afterRemove(AfterRemove afterRemove) {
        this.afterRemove.add(afterRemove);
    }

    void addUpdate(Update update) {
        updatesToAdd.add(update);

        addOrRemove = true;
    }

    void addUpdates(Update[] updates) {
        updatesToAdd.addAll(Arrays.asList(updates));

        addOrRemove = true;
    }

    void removeUpdate(Update update) {
        updatesToRemove.add(update);

        addOrRemove = true;
    }

    void removeUpdates(Update[] updates) {
        updatesToRemove.addAll(Arrays.asList(updates));

        addOrRemove = true;
    }

    void addShow(Show show) {
        showsToAdd.add(show);

        addOrRemove = true;
    }

    void addShows(Show[] shows) {
        showsToAdd.addAll(Arrays.asList(shows));

        addOrRemove = true;
    }

    void removeShow(Show show) {
        showsToRemove.add(show);

        addOrRemove = true;
    }

    void removeShows(Show[] shows) {
        showsToRemove.addAll(Arrays.asList(shows));

        addOrRemove = true;
    }

    void update() {
        for (Update u : updates) u.update();

        if (addOrRemove) {
            shows.addAll(showsToAdd);
            shows.removeAll(showsToRemove);

            showsToAdd.clear();
            showsToRemove.clear();
            
            updates.addAll(updatesToAdd);
            updates.removeAll(updatesToRemove);

            updatesToAdd.clear();
            updatesToRemove.clear();

            // if (afterRemove.size() > 0) {
            for (AfterRemove a : afterRemove) a.afterRemove();

            afterRemove.clear();

            addOrRemove = false;
            // }
        }

        if (doReset) {
            updates.clear();
            shows.clear();

            afterReset.afterReset();

            doReset = false;
        }
    }

    void draw() {
        for (Show s : shows) s.show();
    }
}
