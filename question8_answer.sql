--Sometimes code you are working on can get messy!
--Is there a keyboard shortcut that will help you find  
--where bracket in line 10 is closed?

CREATE TABLE #Temp (Number INT);
INSERT INTO #Temp VALUES (1),(2),(3),(4);

BEGIN/* [( }}(*]]})  ))}]*/  BEGIN/*))]}])))))*/(
/* [[ (}(])(())(}]]*/(/*))]}]]*/(/*))]}]) )] ))*/
/*Where do I close?>>>*/(/*<<<Where do I close?*/
((/* (( }})]*/ (/*)[[ (})(*/ (/* [ [}}]]*/(/*(]*/
/* [( }(]]*/( SELECT * FROM #Temp/* [(])))(()](*/ 
/* [[))(]}] ]}(]  ]})((])}(]}))  )]]}  ))))))]]*/
) /* ([)(}(](}](}(}]( }] ]}] ])  ))))]}((}((}(]*/
)/* [[]]*/)/* (]*/ )/*((]*/)/* [[ ))) )))(())]]*/
/* [[ }}(]]}]]}]]*/)/*))]}]]*/)/* [[ }(]]}]]}]]*/
/* [[ }(]}] ]}(]  ]}]]*((((}]]}]]*}))  )]]}  ]]*/
/* ( }}(]]}]]}]]*/)/*))]}]]*/)/* [[ }}(]]}]}]]*/)
print('')/*))]}];*/;/* ;[[[ }]))]]  ]]]]  ]))]]*/
/* [[ }(]}] ]}(]  ]})]})]})]}))  )]]}  )]}))))]*/
END/*)[[ )}))*/  END/* [[ }}])))]]}]])))])))]]]*/

--A) YES keyboard shortcut: Ctrl + ]
--B) YES keyboard shortcut: Ctrl + K, Ctrl + S
--C) YES keyboard shortcut: Ctrl + End
--D) NO there is no such shortcut




-- CORRECT ANSWER : A) YES keyboard shortcut: Ctrl + ]
-- This shortcut allows you to jump between syntax pairs. It can be really usefull
-- when you are working with large number of nested functions or code blocks. Also
-- remember that you can set bookmarks with Ctrl + K, Ctrl + K and circle back and 
-- forth between them with Ctrl + K, Ctrl + N and Ctrl + K, Ctrl + P
