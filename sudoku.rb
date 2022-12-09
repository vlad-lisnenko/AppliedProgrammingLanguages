GRID_ROW = 9
GRID_COLUMN = 9

def is_conditions_meet (grid, row, column, digit)

  (0..GRID_COLUMN - 1).each { |i|
    if grid[row][i] == digit
      return false
    end
  }

  (0..GRID_ROW - 1).each { |i|
    if grid[i][column] == digit
      return false
    end
  }

  sub_grid3x3 = 3
  startRow = row - row % sub_grid3x3
  startCol = column - column % sub_grid3x3
  for i in 0..sub_grid3x3 - 1 do
    for j in 0..sub_grid3x3 - 1 do
      if (grid[i + startRow][j + startCol] == digit)
        return false
      end
    end
  end
  true
end

def solve_sudoku(grid, row, column)

  if row == GRID_ROW - 1 && column == GRID_COLUMN
    return true
  end

  if column == GRID_COLUMN
    column = 0
    row += 1
  end

  if grid[row][column] != 0
    return solve_sudoku(grid, row, column + 1)
  end

  for digit in 1..9 do
    if is_conditions_meet(grid, row, column, digit)
      grid[row][column] = digit

      if solve_sudoku(grid, row, column + 1)
        return true
      end
    end

    grid[row][column] = 0
  end

  false
end

def print_grid(grid)
  (0..GRID_ROW - 1).each { |i|
    (0..GRID_COLUMN - 1).each { |j|
      print "#{grid[i][j]} "
    }
    puts
  }
  puts
end

def read_from_file(grid, filename)
  file = File.open(filename)

  i = 0
  while i < 9 do
    line = file.readline.to_s.split(",")
    j = 0
    line.each { |value|
      grid[i][j] = value.to_i
      j += 1
    }
    i += 1
  end

  file.close
  grid
end

def main
  grid = Array.new(9) {Array.new(9)}
  sudoku_sources_file = "data/sudoku_sources.txt"

  if File.file?(sudoku_sources_file)
    read_from_file(grid, sudoku_sources_file)
  else
    puts "[::IOError::] => Cannot find or open file!"
  end

  solve_sudoku(grid, 0, 0)
  print_grid(grid)

end

main()


