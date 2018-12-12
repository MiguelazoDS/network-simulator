Object subclass: #Buffer	instanceVariableNames: 'cola'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!Buffer methodsFor: 'as yet unclassified' stamp: 'gustavo 6/14/2018 14:31'!mover: aBuffer

	aBuffer recibir: (cola desencolar ) .! !!Buffer methodsFor: 'as yet unclassified' stamp: 'gustavo 6/14/2018 14:23'!recibir: anObject
	cola encolar: anObject! !!Buffer methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:11'!cola
	^ cola! !!Buffer methodsFor: 'initialization' stamp: 'gustavo 6/14/2018 14:08'!initialize
	"comment stating purpose of message"


	cola := Cola new! !!Buffer methodsFor: 'adding' stamp: 'gustavo 6/14/2018 14:24'!recibirMuchos: aCollection
	"comment stating purpose of message"

	aCollection do: [ :anObj | self recibir:  anObj ]! !Object subclass: #BufferInterno	instanceVariableNames: 'dict'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!BufferInterno methodsFor: 'initialization' stamp: 'gustavo 6/18/2018 12:37'!initialize
	"comment stating purpose of message"
	dict := Dictionary new.! !!BufferInterno methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 13:13'!dict
	^ dict! !!BufferInterno methodsFor: 'as yet unclassified' stamp: 'gustavo 6/18/2018 13:04'!recibir: aPaq
	"comment stating purpose of message"

	| tot a |
	tot := aPaq tbloq.
	a := dict at: aPaq pag ifAbsent: [ dict at: aPaq pag put: (Array new: tot) ].
	a at: (aPaq nbloq) put: aPaq! !Buffer subclass: #BufferSalida	instanceVariableNames: 'bandwidth destino prox_salto'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!BufferSalida methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:38'!bandwidth: anObject
	bandwidth := anObject! !!BufferSalida methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/3/2018 14:12'!prox_salto: anObject	prox_salto := anObject! !!BufferSalida methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/3/2018 14:12'!prox_salto	^ prox_salto! !!BufferSalida methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:38'!bandwidth
	^ bandwidth! !!BufferSalida methodsFor: 'as yet unclassified' stamp: 'CazajousMiguelA 12/6/2018 21:29'!enviar: nodos	"comment stating purpose of message"	| cs buffer |	nodos		do: [ :i | 			i id = prox_salto				ifTrue: [ buffer := i entrada ] ].	cs := cola size min: bandwidth.	1 to: cs do: [ :i | self mover: buffer ]! !OrderedCollection subclass: #Cola	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!Cola methodsFor: 'as yet unclassified' stamp: 'gustavo 6/14/2018 13:37'!primero
	"devuelve el primer elemento de la cola"

	^ self first! !!Cola methodsFor: 'as yet unclassified' stamp: 'gustavo 6/14/2018 13:40'!desencolar
	"saca el primer elemento de la cola"

	| temporary |
	temporary := self primero.
	self removeFirst.
	^ temporary! !!Cola methodsFor: 'as yet unclassified' stamp: 'gustavo 6/14/2018 13:34'!encolar: anObject
	"comment stating purpose of message"

	self addLast: anObject ! !Object subclass: #Config	instanceVariableNames: 'nodos paginas'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!Config methodsFor: 'initialization' stamp: 'CazajousMiguelA 12/4/2018 02:35'!initialize
	"comment stating purpose of message"
	nodos := OrderedCollection  new.	paginas := OrderedCollection new.! !!Config methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 14:04'!nodos: anObject
	nodos := anObject! !!Config methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/4/2018 02:35'!paginas: anObject	paginas := anObject! !!Config methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 14:04'!nodos
	^ nodos! !!Config methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/4/2018 02:35'!paginas	^ paginas! !!Config methodsFor: 'adding' stamp: 'gustavo 6/18/2018 14:11'!addNodo: aNodo
	 nodos add: aNodo
! !!Config methodsFor: 'adding' stamp: 'CazajousMiguelA 12/4/2018 02:36'!addPag: aPag
	 paginas add: aPag! !Object subclass: #Nodo	instanceVariableNames: 'entrada interno id tabla salidas'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!Nodo methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:57'!entrada
	^ entrada! !!Nodo methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:57'!tabla: anObject
	tabla := anObject! !!Nodo methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:57'!id
	^ id! !!Nodo methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:57'!tabla
	^ tabla! !!Nodo methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 15:07'!id: anId
	id:=anId! !!Nodo methodsFor: 'accessing' stamp: 'CazajousMiguelA 11/29/2018 20:31'!salidas	^ salidas! !!Nodo methodsFor: 'accessing' stamp: 'CazajousMiguelA 11/29/2018 14:27'!entrada: anObject	entrada := anObject! !!Nodo methodsFor: 'accessing' stamp: 'gustavo 6/14/2018 14:57'!interno
	^ interno! !!Nodo methodsFor: 'initialization' stamp: 'CazajousMiguelA 12/3/2018 11:02'!initialize
	"comment stating purpose of message"


	entrada := Buffer new.
	tabla := Dictionary new.
	interno := BufferInterno new.	salidas := OrderedCollection new.! !!Nodo methodsFor: 'as yet unclassified' stamp: 'CazajousMiguelA 12/6/2018 21:35'!enviarTodo: nodos	"comment stating purpose of message"	salidas do: [ :i | [ i cola isEmpty ] whileFalse: [ i enviar: nodos ] ]! !!Nodo methodsFor: 'as yet unclassified' stamp: 'CazajousMiguelA 12/3/2018 21:24'!guardar	"comment stating purpose of message"	| name key array dict |	dict := interno dict.	key := dict keys at: 1.	array := interno dict at: key.	name := 'nodo' , id asString , '-pagina' , key asString.	FileStream		forceNewFileNamed: name		do: [ :stream | 			stream				nextPutAll: 'Origen: ' , (array at: 1) origen asString;				cr;				nextPutAll: 'Destino: ' , (array at: 1) destino asString;				cr;				nextPutAll: 'Tamaño de pág inicial: ' , (array at: 1) tbloq asString;				cr;				nextPutAll: 'Total recibido: ' , array size asString;				cr;				close ].	interno initialize! !!Nodo methodsFor: 'as yet unclassified' stamp: 'CazajousMiguelA 12/6/2018 21:39'!distribuir	"identifica si el paq es para reenviar o queda local"	| temp next_hop |	next_hop := nil.	[ entrada cola isEmpty ]		whileFalse: [ temp := entrada cola desencolar.			temp destino = id				ifTrue: [ interno recibir: temp ]				ifFalse: [ tabla						at: temp destino						ifPresent: [ next_hop := tabla at: temp destino.							salidas								do: [ :i | 									i prox_salto = next_hop										ifTrue: [ i recibir: temp ] ] ].					tabla						at: temp destino						ifAbsent: [ Transcript								show: 'No se puede llegar al destino';								cr ] ] ]! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Nodo class	instanceVariableNames: ''!!Nodo class methodsFor: 'instance creation' stamp: 'CazajousMiguelA 12/3/2018 12:17'!id: anId tam: tam	"comment stating purpose of message"	| temp sals |	temp := self new.	temp id: anId.	sals := temp salidas.	1 to: tam do: [ :each | sals add: BufferSalida new ].	^ temp! !Object subclass: #Pagina	instanceVariableNames: 'paquetes'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!Pagina methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/1/2018 16:40'!paquetes	"comment stating purpose of message"	^ paquetes! !!Pagina methodsFor: 'initialization' stamp: 'CazajousMiguelA 12/1/2018 16:44'!initialize	"comment stating purpose of message"	paquetes := OrderedCollection new.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Pagina class	instanceVariableNames: ''!!Pagina class methodsFor: 'instance creation' stamp: 'CazajousMiguelA 12/3/2018 12:17'!or: or dest: dest tbloq: tb pag: pag	"comment stating purpose of message"	| temp paqs |	temp := self new.	paqs := temp paquetes.	1 to: tb do: [ :each | 		paqs add: Paquete new.		(paqs at: each) origen: or.		(paqs at: each) tbloq: tb.		(paqs at: each) nbloq: each.		(paqs at: each) destino: dest.		(paqs at: each) pag: pag ].	^ temp! !Object subclass: #Paquete	instanceVariableNames: 'origen destino pag nbloq tbloq'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!destino: anObject
	destino := anObject! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!pag: anObject
	pag := anObject! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!destino
	^ destino! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!origen
	^ origen! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!nbloq: anObject
	nbloq := anObject! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!tbloq: anObject
	tbloq := anObject! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!origen: anObject
	origen := anObject! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!tbloq
	^ tbloq! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!pag
	^ pag! !!Paquete methodsFor: 'accessing' stamp: 'gustavo 6/18/2018 12:32'!nbloq
	^ nbloq! !Object subclass: #Red	instanceVariableNames: ''	classVariableNames: 'current'	poolDictionaries: ''	category: 'Simula_Red'!"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Red class	instanceVariableNames: ''!!Red class methodsFor: 'as yet unclassified' stamp: 'gustavo 6/18/2018 14:08'!unico

	current isNil
		ifTrue: [ current := Config new ].
	^ current! !!Red class methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/4/2018 13:05'!reset	"comment stating purpose of message"	current isNil
		ifFalse: [ current := nil.].
! !!Red class methodsFor: 'instance creation' stamp: 'gustavo 6/18/2018 13:55'!new
	"comment stating purpose of message"

	self shouldNotImplement ! !Object subclass: #Start	instanceVariableNames: 'red'	classVariableNames: ''	poolDictionaries: ''	category: 'Simula_Red'!!Start methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/4/2018 13:28'!red	^ red! !!Start methodsFor: 'accessing' stamp: 'CazajousMiguelA 12/4/2018 13:36'!start	"comment stating purpose of message"	|file var line a b c d re |	file := FileStream fileNamed: 'inicializacion'.	[ file atEnd ]		whileFalse: [ 			line := file nextLine.			var := line matchesRegex: 'nodo\..+'.			var 				ifTrue: [ 								re := '(nodo\.)(\d+)\.(\d+)' asRegex.								re matchesPrefix: line.								a := (re subexpression: 3) asInteger.								b := (re subexpression: 4) asInteger.								red addNodo: (Nodo id: a tam: b) 							].			var := line matchesRegex: 'pagina\..+'.			var				ifTrue: [ 								re := '(pagina\.)(\d+)\.(\d+)\.(\d+)\.(\d+)' asRegex.								re matchesPrefix: line.								a := (re subexpression: 3) asInteger.								b := (re subexpression: 4) asInteger.								c := (re subexpression: 5) asInteger.								d := (re subexpression: 6) asInteger.								red addPag:	(Pagina or: a dest: b	tbloq: c	pag: d) 							].			var := line matchesRegex: 'salto\..+'.			var				ifTrue: [ 								re := '(salto\.)(\d+)\.(\d+)\.(\d+)' asRegex.								re matchesPrefix: line.								a := (re subexpression: 3) asInteger.								b := (re subexpression: 4) asInteger.								c := (re subexpression: 5) asInteger.								((red nodos at: a) salidas at: b) prox_salto: c 							].			var := line matchesRegex: 'bw\..+'.			var				ifTrue: [ 								re := '(bw\.)(\d+)\.(\d+)\.(\d+)' asRegex.								re matchesPrefix: line.								a := (re subexpression: 3) asInteger.								b := (re subexpression: 4) asInteger.								c := (re subexpression: 5) asInteger.								((red nodos at: a) salidas at: b) bandwidth: c 						 	].			var := line matchesRegex: 'tabla\..+'.			var				ifTrue: [ 								re := '(tabla\.)(\d+)\.(\d+)\.(\d+)' asRegex.								re matchesPrefix: line.								a := (re subexpression: 3) asInteger.								b := (re subexpression: 4) asInteger.								c := (re subexpression: 5) asInteger.								(red nodos at: a) tabla at: b put: c 							]. 					]! !!Start methodsFor: 'initialization' stamp: 'CazajousMiguelA 12/4/2018 13:32'!initialize	"comment stating purpose of message"	Red reset.	red := Red unico.! !