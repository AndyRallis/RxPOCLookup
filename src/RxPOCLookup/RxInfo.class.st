"
I'm a list of perscription drugs. I contain Rx classes.
"
Class {
	#name : #RxInfo,
	#superclass : #Object,
	#instVars : [
		'rxList',
		'exactDrugList',
		'drugNameList'
	],
	#category : #RxPOCLookup
}

{ #category : #'read-in' }
RxInfo class >> createRxList: file [
	^ self new
		rxList:
			((NeoCSVReader on: file asFileReference readStream)
				recordClass: Rx;
				skipHeader;
				addField: #ndcnum:;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addField: #pksize:;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addField: #strngth:;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addField: #mstfmds:;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addField: #prodnme:;
				addIgnoredField;
				addField: #gennme:;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				addIgnoredField;
				upToEnd);
				drugNameList;
				yourself
]

{ #category : #accessing }
RxInfo >> drugNameList [
	drugNameList := (rxList collect: [ :rx | rx prodnme ]) asSet asOrderedCollection
]

{ #category : #'rx-matcher' }
RxInfo >> findDrug: aDrugName [
	"Fuzzy drug match to return top drugs"

	^ FuzzyMatcher
		allSortedByScoreMatching: aDrugName
		in: drugNameList
]

{ #category : #'rx-matcher' }
RxInfo >> findDrugInDictionary: aDrugName [
	exactDrugList := self findExactDrug: aDrugName.
	^ self intoRxDictionary
]

{ #category : #'rx-matcher' }
RxInfo >> findExactDrug: aDrugName [ 
	"When user selects from the list, we then pull all drugs with exact match"
	^ rxList select: [ :rx | rx prodnme asUppercase = aDrugName asUppercase ]
]

{ #category : #'rx-matcher' }
RxInfo >> findTopDrugMatch: anInteger key: aKey [
	^ (self findDrug: aKey)
		takeFirst: anInteger
]

{ #category : #'rx-matcher' }
RxInfo >> intoRxDictionary [
	^ exactDrugList collect: [ :rx | rx intoDictionary ]
	

]

{ #category : #accessing }
RxInfo >> rxList [
	^ rxList
]

{ #category : #accessing }
RxInfo >> rxList: aList [
	rxList := aList
]
