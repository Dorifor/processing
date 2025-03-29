public class Cell {
  Position pos;
  CellState state;
  CellState next_state;
  ArrayList<Cell> neighbors;
  int size;

  Cell(int x_pos, int y_pos, int size) {
    this.pos = new Position(x_pos, y_pos);
    this.size = size;
    this.state = CellState.DEAD;
    this.next_state = this.state;
  }

  void update(boolean debug_mode) {
    ArrayList<Cell> alive_neighbors = (ArrayList) neighbors.clone();
    alive_neighbors.removeIf(cell -> cell.state == CellState.DEAD);
    
    if (this.state == CellState.ALIVE) {
      if (alive_neighbors.size() < 2 || alive_neighbors.size() > 3) this.next_state = CellState.DEAD;
      else this.next_state = CellState.ALIVE;
    } else if (alive_neighbors.size() == 3) {
      this.next_state = CellState.ALIVE;
    }

    if (debug_mode && this.state != this.next_state) println(this + " -> " + this.next_state);
  }

  void apply_state() {
    this.state = this.next_state;
    color cell_color;

    if (this.state == CellState.ALIVE) cell_color = color(0);
    else cell_color = color(255);

    fill(cell_color);

    rect(this.pos.x * this.size, this.pos.y * this.size, this.size, this.size);
  }

  String toString() {
    return "Cell at " + this.pos + " - state : " + this.state;
  }
}

class Position {
  int x;
  int y;

  Position (int x, int y) {
    this.x = x;
    this.y = y;
  }

  String toString() {
    return this.x + ", " + this.y;
  }

  @Override
    public boolean equals(Object o) {
    if (o == null) return false;
    if (o == this) return true;
    return this.x == ((Position)o).x && this.y == ((Position)o).y;
  }

  Position clone() {
    return new Position(this.x, this.y);
  }

  Position add(int x, int y) {
    return new Position(this.x + x, this.y + y);
  }
}

public enum CellState {
  DEAD,
    ALIVE
}
