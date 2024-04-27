python mode 
    Interactive mode (REPL)
    patch or script 

# ---------------------------- #

which python3
    عشان تعرفني بايثون نزلت فين

# ---------------------------- #

execute python script
    python3 test.py
    /bin/python3 test.py
# ---------------------------- #

ipython3
    Enhanced Interactive mode 
    ipython3                        [to use it]
        %ls                         [or any other command]
        %timeit print('khaled')
        %lsmagic                    [ % عشان توريك كل الكومند الي ممكن تيجي ورا ]

# ---------------------------- #

package - module - libirary - framework
    import os
    os.getcwd()
    os.uname()

    import sys
    sys.path                        [ package المكان الي بيروح فيهم يدور ع ]
# ---------------------------- #
external package [pypi]
    pip install numpy               [to install the external package to use it]

# ---------------------------- #
pip [from pypi]
    pip list
    pip show numpy
# ---------------------------- #
virtual enviroment
    python3 -m venv test-venv       [ to create virtual enviroment ]
    source test-venv/bin/activate   [ to run on the virtual enviroment ] 
    deactivate                      [ to logout from virtual enviroment ]

# ---------------------------- #
anaconda 
    anaconda-navigator
    package managment و enviroment  وظيفته ال 
# ---------------------------- #
jupyter
    b               => cell blew
    a               => cell above
    shift + enter   => run command
# ---------------------------- python  ---------------------------- #
espace charchter
# ---------------------------- #
type(variable)
# ---------------------------- #

order 
    يعني الترتيب هيفرق معايا
    list
    tuples
    string

non order 
    لخبط براحتط
    sets
    directories
    
# ---------------------------- #

list != array

list []
    عادي تحط اي حاجه مع بعض
    [1,'khaled',(1,2)]
    ------------------------------
    order and mutable
    ------------------------------
    concatianating
        يعني بلزق الاتنين ليست جمب بعض
        [1,2] + [5,6,8] = [1,2,5,6,8]
    ------------------------------
    enumerate
        cars = [1,2,3]
        enumerate(cars)
        list(enumerate(cars)) #unpacking sequence    
    ------------------------------
    list slicing
        list[start:stop:step]
# ---------------------------- #
mutable
    يعني ممكن يتعدل
# ---------------------------- #
range
    sequence بتعمل 
    list غالبا بنحولها ل 
range(5) = range(0,5)
list(range(5))
    [0,1,2,3,4]

/home/khaled/Pictures/Screenshots/Screenshot from 2024-04-27 08-54-03.png
# ---------------------------- #
slicing
(start,stop,step)
stop
    الرقم دا مش هوصله , هوصل ل قبله برقم






        
