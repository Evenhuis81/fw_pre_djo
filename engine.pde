class Engine {
    AfterReset afterReset;
    AfterRemove afterRemove;
    ArrayList<Update> updates, updatesToAdd, updatesToRemove;
    ArrayList<Show> shows, showsToAdd, showsToRemove;
    boolean updatesReadyToAddOrRemove = false;
    boolean showsReadyToAddOrRemove = false;
    boolean afterRemoveSet = false;
    boolean updateResetDone = false;
    boolean showResetDone = false;
    boolean showStatistics = false;
    boolean doReset = false;

    Engine() {
        updates = new ArrayList<Update>();
        updatesToRemove = new ArrayList<Update>();
        updatesToAdd = new ArrayList<Update>();
        shows = new ArrayList<Show>();
        showsToRemove = new ArrayList<Show>();
        showsToAdd = new ArrayList<Show>();
    }

    void switchStatShow() {
        showStatistics = !showStatistics;
    }

    void removeUpdateAndShow(Update update, Show show, AfterRemove afterRemove) {
        this.afterRemove = afterRemove;

        if (afterRemoveSet) {
            println("afterRemoveSet is already set!!!");

            return;
        }

        afterRemoveSet = true;

        removeUpdate(update);
        removeShow(show);
    }

    void reset(AfterReset afterReset) {
        this.afterReset = afterReset;

        doReset = true;
    }

    void addUpdate(Update update) {
        updatesToAdd.add(update);

        if (updatesReadyToAddOrRemove) {
            println("updatesReadyToAddOrRemove is already set!!!");

            return;
        }

        updatesReadyToAddOrRemove = true;
    }

    void addUpdate(Update[] updates) {
        updatesToAdd.addAll(Arrays.asList(updates));

        if (afterRemoveSet) {
            println("updatesReadyToAddOrRemove is already set!!!");

            return;
        }

        updatesReadyToAddOrRemove = true;
    }

    void removeUpdate(Update update) {
        updatesToRemove.add(update);

        if (afterRemoveSet) {
            println("updatesReadyToAddOrRemove is already set!!!");

            return;
        }

        updatesReadyToAddOrRemove = true;
    }

    void addShow(Show show) {
        showsToAdd.add(show);

        if (afterRemoveSet) {
            println("showsReadyToAddOrRemove is already set!!!");

            return;
        }

        showsReadyToAddOrRemove = true;
    }

    void addShow(Show[] shows) {
        showsToAdd.addAll(Arrays.asList(shows));

        if (afterRemoveSet) {
            println("showsReadyToAddOrRemove is already set!!!");

            return;
        }

        showsReadyToAddOrRemove = true;
    }

    void removeShow(Show show) {
        showsToRemove.add(show);

        if (afterRemoveSet) {
            println("showsReadyToAddOrRemove is already set!!!");

            return;
        }

        showsReadyToAddOrRemove = true;
    }

    void update() {
        for (Update u : updates) u.update();

        if (updatesReadyToAddOrRemove) {
            updates.addAll(updatesToAdd);
            updates.removeAll(updatesToRemove);

            updatesToAdd.clear();
            updatesToRemove.clear();

            updatesReadyToAddOrRemove = false;

            verifyAfterRemove();
        }

        if (doReset) {
            updates.clear();

            updateResetDone = true;

            verifyResetDone();
        }
    }

    void verifyAfterRemove() {
        if (afterRemoveSet && !updatesReadyToAddOrRemove && !showsReadyToAddOrRemove) {
            afterRemoveSet = false;

            afterRemove.afterRemove();
        }
    }

    void verifyResetDone() {
        if (updateResetDone && showResetDone) {
            updateResetDone = false;
            showResetDone = false;
            doReset = false;

            afterReset.afterReset();
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

            verifyAfterRemove();
        }

        if (doReset) {
            shows.clear();

            showResetDone = true;

            verifyResetDone();
        }

        if (showStatistics) showStats();
    }

    void showStats() {
        textAlign(LEFT, TOP);
        textSize(26);
        fill(255);
        text("Shows:   " + shows.size(), width - 150, 30);
        text("Updates: " + updates.size(), width - 150, 60);
    }
}
