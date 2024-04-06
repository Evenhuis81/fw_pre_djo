class Statistics implements Show {
    ArrayList<Statistic> stats = new ArrayList<Statistic>();
    PVector pos = new PVector(width - 200, 50);
    boolean active = false;

    void add(Statistic statistic) {
        stats.add(statistic);
    }

    void remove(Statistic statistic) {
        stats.remove(statistic);
    }

    void show() {
        textAlign(LEFT, TOP);
        textSize(26);
        fill(255);

        for (int i = 0; i < stats.size(); i++) {
            text(stats.get(i).getTxt(), pos.x, pos.y + i * 30);
        }
    }

    void toggle() {
        if (!active) {
            engine.addShow(this);

            active = true;

            return;
        }

        engine.removeShow(this);

        active = false;
    }
}

void setStatistics() {
    Statistic engineShows = new EngineShowsStatistic();
    Statistic engineUpdates = new EngineUpdatesStatistic();

    statistics.add(engineShows);
    statistics.add(engineUpdates);
}


class EngineShowsStatistic implements Statistic {
    String getTxt() {
        return "Shows:   " + engine.shows.size();
    };
}

class EngineUpdatesStatistic implements Statistic {
    String getTxt() {
        return "Updates: " + engine.updates.size();
    };
}
