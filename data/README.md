# Data provenance

The analysis-ready file `animaltraits_bmr.csv` is derived from the standardized `observations.csv` table in AnimalTraits version 1.0.7.

- Dataset: AnimalTraits - a curated animal trait database for body mass, metabolic rate and brain size
- Zenodo record: https://doi.org/10.5281/zenodo.6468938
- Direct source file: https://zenodo.org/records/6468938/files/observations.csv?download=1
- Source file MD5: `79ccdf4e022800e76e5444f9fbfecdc1`
- Data license: CC0 1.0
- Reference article: Herberstein et al., *Scientific Data* 9, 265 (2022), https://doi.org/10.1038/s41597-022-01364-9

## Derivation

The preparation script retains records that:

- use the `basal metabolic rate` method;
- have non-missing, positive body mass and metabolic rate;
- belong to Aves or Mammalia.

The resulting table contains 279 records: 133 Aves and 146 Mammalia.

To reproduce the table, place the downloaded source file at `data/raw/observations.csv`, then run from the repository root:

```bash
Rscript scripts/prepare_data.R
```

The original source file is not redistributed in this repository. The smaller derived table is included so the notebook remains directly reproducible.
