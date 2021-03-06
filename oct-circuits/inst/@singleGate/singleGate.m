## Copyright (C) 2014  James Logan Mayfield
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Usage: g = @singleGate(name,tar)
##
## Construct a gate object for apply 'name' gate to target qubit number
## tar

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: Circuits

function g = singleGate(name,tar)

  if( nargin == 0 )
    ## default to Identity on qubit 0
    g.name = "I";
    g.tar = 0;
    g = class(g,"singleGate");
  else
    g.name = name;
    g.tar = tar;
    g = class(g,"singleGate");
  endif

endfunction
