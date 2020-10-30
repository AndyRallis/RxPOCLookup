Class {
	#name : #RxServer,
	#superclass : #Object,
	#instVars : [
		'rxInfo',
		'teapotServer'
	],
	#category : #RxPOCLookup
}

{ #category : #public }
RxServer class >> startOn: aPortInteger [
	^ self new
		initializePort: aPortInteger;
		registerRoutes;
		registerErrorHandlers;
		yourself
]

{ #category : #registering }
RxServer class >> stopAll [
	self allInstancesDo: #stop
]

{ #category : #handlers }
RxServer >> fuzzyMatch: aRequest [
	| parsedMessage |
	parsedMessage := ((NeoJSONReader fromString: (aRequest entity contents)) at: 'drugName').
	^ (NeoJSONWriter toString: (rxInfo findTopDrugMatch: 3 key: parsedMessage)) 
]

{ #category : #initialization }
RxServer >> initialize [
	super initialize.
	rxInfo := RxInfo createRxList: 'sample.csv'
]

{ #category : #initialization }
RxServer >> initializePort: anInteger [
	teapotServer := Teapot configure: { 
		#defaultOutput -> #json.
		#port -> anInteger.
		#debugMode -> true
	 }.
	teapotServer start
]

{ #category : #routes }
RxServer >> registerErrorHandlers [
	teapotServer 
		exception: KeyNotFound -> (TeaResponse notFound body: 'No such message')
]

{ #category : #routes }
RxServer >> registerRoutes [
	teapotServer
		POST: '/fuzzydrug' -> (Send message: #fuzzyMatch: to: self)
]

{ #category : #accessing }
RxServer >> stop [
	teapotServer stop
]
