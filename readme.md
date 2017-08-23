# Readme for edc-mark-distribution

## What this does
- Takes in a file of a similar format to `results-first-round.txt`, and creates a .csv of marks obtained
- This .csv can then be utilise to create various charts/graphs, such as a histogram of the distribution of marks

- In short, this program is used to produce (really bad) statistics on the edc assignment 1 results

- Upcoming: Taking in multiple result files (csv) and creating a 3D graph of the results-first-round
- Upcoming: Create a heatmap of tests passed/failed based on multiple test results

## Usage
- Run: `./getMarkLines.sh`
	- Ensure this has permission to run in the first place (`chmod +x getMarkLines.sh`)
	- This will process all files with the name "results*.txt" and run the program described in the .cpp file on them, producing a .csv for each input file

### Details on the .cpp program
- Reads a file (given as the first argument), and extracts numbers from them.
- Outputs these numbers into a .csv file, with one row per value
