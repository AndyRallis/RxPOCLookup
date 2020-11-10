# RxPOCLookup
## This is a POC on a drug lookup API. There are two parts:

1. The /fuzzydrug lookup.
- The API takes a JSON with the structure {"drugName": "PARTIAL NAME"} and fuzzy matches against a list of drug names
- The top 5 are returned

2. /exactdrug
- The API takes a JSON with the structure {"drugName": "PARTIAL NAME"} and fuzzy matches against a list of drug names
- ndc, package size, strength, format, generic name are returned for all exact drug name matches

## Initialization
1) curl -L https://get.pharo.org/64/ | bash
2) unzip pharo zip
3) ./pharo Pharo.image --save --quit rxpocinstall.st 2>>error_log.txt
4) ./pharo Pharo.image rxstart.st 2>>error_log.txt & disown
