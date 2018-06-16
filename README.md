# Open School Data
#
**Open School Data** is a JSON API of Open state-funded schools data. Any data used are available for download on the GOV UK [Get School Information](https://get-information-schools.service.gov.uk/) service website.

## Usage

Retrieve a subset of schools by text based filtering ([run](http://open-school-data.recompile.io/schools.json\?keyword\=Tadcaster))

```
curl http://open-school-data.recompile.io/schools.json\?keyword\=Tadcaster
```

Retrieve a school by urn ([run](http://open-school-data.recompile.io/schools/144631.json))

```
curl http://open-school-data.recompile.io/schools/144631.json
```
