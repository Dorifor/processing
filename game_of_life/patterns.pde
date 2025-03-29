void generate_toad_pattern(int x, int y) {
  initial_cells.add(new Position(x    , y    ));
  initial_cells.add(new Position(x + 1, y    ));
  initial_cells.add(new Position(x + 2, y    ));
  initial_cells.add(new Position(x + 1, y + 1));
  initial_cells.add(new Position(x + 2, y + 1));
  initial_cells.add(new Position(x + 3, y + 1));
}

void generate_block_pattern(int x, int y) {
  initial_cells.add(new Position(x    , y    ));
  initial_cells.add(new Position(x + 1, y    ));
  initial_cells.add(new Position(x    , y + 1));
  initial_cells.add(new Position(x + 1, y + 1));
}

void generate_aircraft_carrier_pattern(int x, int y) {
  initial_cells.add(new Position(x    , y    ));
  initial_cells.add(new Position(x + 1, y    ));
  initial_cells.add(new Position(x    , y + 1));
  initial_cells.add(new Position(x + 2, y + 2));
  initial_cells.add(new Position(x + 3, y + 2));
  initial_cells.add(new Position(x + 3, y + 1));
}

void generate_glider_pattern(int x, int y) {
  initial_cells.add(new Position(x    , y    ));
  initial_cells.add(new Position(x + 1, y + 1));
  initial_cells.add(new Position(x + 1, y + 2));
  initial_cells.add(new Position(x    , y + 2));
  initial_cells.add(new Position(x - 1, y + 2));

}
