int cell_size = 10;
ArrayList<Cell> cells = new ArrayList();
ArrayList<Position> initial_cells = new ArrayList();

void setup() {
  size(500, 500);
  //noStroke();
  background(255);
  stroke(240);
  fill(0);
  loop();
  init_positions();
  fill_of_cells();
  init_cell_neighbors();
}

void init_positions() {
  // Toad
  generate_toad_pattern(10, 5);
  
  // Aircraft carrier
  generate_aircraft_carrier_pattern(20, 5);
  
  // Glider(s)
  generate_glider_pattern(10, 10);
  generate_glider_pattern(15, 10);
  generate_glider_pattern(20, 10);
  generate_glider_pattern(25, 10);
}

void fill_of_cells() {
  for (int x = 0; x < width / cell_size; x++) {
    for (int y = 0; y < height / cell_size; y++) {
      Cell cell = new Cell(x, y, cell_size);
      initial_cells.forEach((pos) -> {
        if (pos.equals(cell.pos)) {
          cell.next_state = CellState.ALIVE;
        };
      }
      );
      cells.add(cell);
      cell.apply_state();
    }
  }
}

void draw() {
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    update();
  }
}

void update() {
  cells.forEach(cell -> cell.update(false));
  cells.forEach(cell -> cell.apply_state());
}

void init_cell_neighbors() {
  cells.forEach(cell -> {
    cell.neighbors = get_neighbors(cell);
  }
  );
}

ArrayList<Cell> get_neighbors(Cell cell) {
  ArrayList<Cell> neighbors = new ArrayList();

  ArrayList<Position> neighbor_positions = get_neighbor_positions(cell.pos);
  cells.forEach(c -> {
    if (neighbor_positions.contains(c.pos)) {
      neighbors.add(c);
    }
  }
  );

  return neighbors;
}

ArrayList<Position> get_neighbor_positions(Position position) {
  ArrayList<Position> neighbor_positions = new ArrayList();

  neighbor_positions.add(position.add(-1, -1));
  neighbor_positions.add(position.add(0, -1));
  neighbor_positions.add(position.add(1, -1));
  neighbor_positions.add(position.add(-1, 0));
  neighbor_positions.add(position.add(1, 0));
  neighbor_positions.add(position.add(-1, 1));
  neighbor_positions.add(position.add(0, 1));
  neighbor_positions.add(position.add(1, 1));

  return neighbor_positions;
}
