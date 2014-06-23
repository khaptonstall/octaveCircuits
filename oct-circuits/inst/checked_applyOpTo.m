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

## Usage: y = checked_applyOpTo(x,A,ts,n)
##
## apply the single qubit operator A to all the bits listed in 
## the vector ts of the n bit pure state x. Checks the following
## preconditions: ts should contain no duplicate entries and all 
## entries in ts should be from [0,n). The operator A should be a 2x2
## unitary matrix. The pure state x is a 2^n vector.
##
## based on paper by Kaushik, Gropp, Minkoff, and Smith

## Author: Logan Mayfield
## Keyword: Circuits

function y = checked_applyOpTo(x,A,ts,n)
  
  if( !isequal(size(A),[2,2]) )
    error("Operator must be Single Qubit (2x2). Given %dx%d",rows(A),columns(A));
  elseif( (rows(ts) != 1 || columns(ts) != 1) && ...
  	  (length(ts) < 1 || length(ts) > n) )
    error("Target Vector size mismatch. Given %dx%d",rows(ts),columns(ts));
  elseif( !isequals(unique(ts),ts) )
    error("Target Vector contains duplicate entries");
  elseif( log2(x) != n )
    error("State vector, dimension mismatch");
  endif

  y=applyOpTo(x,A,ts,n);

endfunction

%!test
%! fail('checked_applyOpTo(stdBasis(1,2),eye(4),[0,1],2')
%! fail('checked_applyOpTo(stdBasis(1,2),eye(2),[0,1,2],2')
%! fail('checked_applyOpTo(stdBasis(1,2),eye(2),[],2')
%! fail('checked_applyOpTo(stdBasis(1,2),eye(2),[1,1],2')
%! fail('checked_applyOpTo(stdBasis(1,1),eye(4),[0,1],2')
