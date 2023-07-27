
# '=' operator
var=10 # assign 10 to var
str="btats" # assign btats to str
str = "btats" # this is wrong, it will give an error
# spaces are not allowed around the '=' operator

#   =  as a test operator

if [ "$string1" = "$string2" ]
then
   command
fi

#  if [ "X$string1" = "X$string2" ] is safer,
#+ to prevent an error message should one of the variables be empty.
#  (The prepended "X" characters cancel out.)

# + - * / % ** where ** is exponentiation

# ex:
expr 5 + 2;
expr 5 % 3;


#Bash does not understand floating point arithmetic. It treats numbers containing a decimal point as strings.
a=1.5

let "b = $a + 1.3"  # Error.
# t2.sh: let: b = 1.5 + 1.3: syntax error in expression
#                            (error token is ".5 + 1.3")

echo "b = $b"       # b=1


# bitwise operators
# ~ bitwise negation
# << left shift
# >> right shift
# <<= var <<= 2 is the same as var = var << 2
# & bitwise AND , &=
# ^ bitwise XOR , ^=
# | bitwise OR , |=

# boolean operators
# ! logical NOT
# && logical AND
# || logical OR


# comma operator
# The comma operator links together a series of arithmetic operations. All are evaluated, but only the last one is returned.

# comparison operators
# -eq: equal to
# -ne: not equal to
# -gt: greater than
# -ge: greater than or equal to
# -lt: less than
# -le: less than or equal to
# -a : logical AND
# -o : logical OR
    # Note that the && and || operators are not valid within a [ ... ] construct.
# > < >= <=

# string comparison operators
# =: equal to
# !=: not equal to
# >: greater than, in ASCII alphabetical order
# <: less than, in ASCII alphabetical order
# -z: string is null, that is, has zero length
# -n: string is not null.
# \> and \< are used for string comparison within a [[ ... ]] test construct.
    # \> is equivalent to > and \< is equivalent to <.


let "t2 = ((a = 9, 15 / 3))"
echo "t3 = $t2"


# file test operators
# -e : file exists
# -f : file is a regular file (not a directory or device file)
# -s : file is not zero size
# -d : file is a directory
# -b : file is a block device
# -c : file is a character device