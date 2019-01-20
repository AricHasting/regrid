export *

class Actor
  new: =>
    @x = 1
    @y = 1
    @id = -1
    @grid = nil
  
  move: (x, y) =>
    @grid\move_actor x, y, @id

  destroy: =>
    @grid\remove_actor @id