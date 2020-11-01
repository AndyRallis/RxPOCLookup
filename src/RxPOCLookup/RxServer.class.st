"
I'm an RxServer. I contain a Teapot REST server and wrap RxInfo's fuzzy and exact lookup methods with URLs.

POST /fuzzydrug and ""drugName"" in the JSON body to get a list of fuzzy drugs
POST /exactdrug and ""drugName"" in the JSON body to get a list of possible matches
"
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
RxServer >> exactMatchHandler: aRequest [
	| parsedMessage |
	parsedMessage := ((NeoJSONReader fromString: (aRequest entity contents)) at: 'drugName').
	^ self lookupAndFormatDrug: parsedMessage
]

{ #category : #handlers }
RxServer >> fuzzyMatchHandler: aRequest [
	| parsedMessage |
	parsedMessage := ((NeoJSONReader fromString: (aRequest entity contents)) at: 'drugName').
	^ rxInfo findTopDrugMatch: 3 key: parsedMessage
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

{ #category : #handlers }
RxServer >> lookupAndFormatDrug: aDrugName [
	^ rxInfo findDrugInDictionary: aDrugName
]

{ #category : #routes }
RxServer >> registerErrorHandlers [
	teapotServer 
		exception: KeyNotFound -> (TeaResponse notFound body: 'No such message')
]

{ #category : #routes }
RxServer >> registerRoutes [
	teapotServer
		POST: '/fuzzydrug' -> (Send message: #fuzzyMatchHandler: to: self);
		POST: '/exactdrug' -> (Send message: #exactMatchHandler: to: self)
]

{ #category : #accessing }
RxServer >> stop [
	teapotServer stop
]
