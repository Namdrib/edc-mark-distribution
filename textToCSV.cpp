#include <algorithm>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>
using namespace std;

const int numTests = 89;
const string ext = ".csv";

int main(int argc, char* argv[])
{
	string filename = (argc <= 1) ? "out" : (string)argv[1];
	// cerr << "File is " << filename + ext << endl;
	// Read results
	vector<int> results;
	for (string temp; getline(cin, temp); )
	{
		// cerr << "temp: " << temp << endl;
		stringstream ss(temp);
		ss >> temp;
		
		if (temp == "You")
		{
			results.push_back(89);
		}
		else
		{
			results.push_back(stoi(temp));
		}
	}
	// cerr << "finished for loop" << endl;
	// Output to csv file
	ofstream of(filename + ext);
	if (!of.is_open())
	{
		cerr << "Error, could not open file " << filename << endl;
		exit(1);
	}
	for (size_t i=0; i<results.size(); i++)
	{
		double testsPassed = results[i] / (double) numTests;
		of << testsPassed << endl;
	}
	of.close();
}
