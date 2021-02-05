#ifndef BASIC_H
#define BASIC_H

#include <stdio.h>
#include <string.h>
// #include <ctype.h>
#include <stdlib.h>
#include <time.h>


typedef struct string {
	size_t length;
	size_t allocated;
	char* data;
} string;

typedef struct strings {
	size_t length;
	size_t allocated;
	char** data;
} strings;


string make_string(size_t n);
void free_string(string f);
string copy_string(string a);

string read_file(const char *filename);

strings make_string_array();
void free_string_array(strings f);
void string_array_add(strings* f, char* a);

double get_time(void);
double min(double a, double b);
int split_main(int argc, char** argv);


string make_string(size_t n)
{
	string f;
	f.length = 0;
	f.allocated = n;
	f.data = (char*)malloc(n);
	return f;
}

string copy_string(string a)
{
	string b;
	b.length = a.length;
	b.allocated = a.allocated;
	b.data = (char*)malloc(b.allocated*sizeof(char));
	strcpy(b.data, a.data);
	return b;
}

void free_string(string f)
{
	free(f.data);
}

string read_file (const char *filename)
{
	string f = make_string(1000);

	FILE *fp;
	int c;

	fp = fopen(filename, "r");
	if (fp == NULL) {
		char err[200];
		snprintf(err, 200, "Error in opening file %s", filename);
		perror(err);
		return f;
	}

	while (1) {
		c = fgetc(fp);
		if (feof(fp)) { 
			f.data[f.length] = '\0';
			f.length += 1;
			break; 
		}

		f.data[f.length] = (char)c;
		f.length += 1;
		// maybe grow
		if (f.length == f.allocated){
			f.allocated *= 2;
			f.data = (char*)realloc(f.data, f.allocated*sizeof(char));
		}
	}
	fclose(fp);

	return f;
}

strings make_string_array()
{
	strings f;
	f.length = 0;
	f.allocated = 10;
	f.data = (char**)malloc(f.allocated * sizeof(char**));
	return f;
}

void free_string_array(strings f)
{
	free(f.data);
}

void string_array_add(strings* f, char* a)
{
	if (f->length == f->allocated){
		f->allocated *= 2;
		f->data = (char**)realloc(f->data, f->allocated*sizeof(char**));
		printf("GROW!!!\n");
	}

	f->data[f->length] = a;
	f->length += 1;
}


double get_time(void)
{
	return clock()/(double)CLOCKS_PER_SEC;
}

double min(double a, double b)
{
	if (a < b ){
		return a;
	}
	return b;
}

strings split_string(string s, const char* split_chars)
{
	// string c = copy_string(s);
	char *a = s.data;
	strings lines = make_string_array();

	string_array_add(&lines, &(a[0]));

	size_t strlen_a = strlen(a);
	// printf("strlen(a) %lu\n", strlen(a));

	for (size_t i = 1; i < strlen_a; i++){

		for (size_t j = 0; j < strlen(split_chars); j++)
		{
			if ( a[i] == split_chars[j] ){ a[i] = '\0'; break; }
		}
	}

	for (size_t i = 1; i < strlen_a; i++) {

		if (a[i-1] == '\0' && a[i] != '\0') {
			string_array_add(&lines, &(a[i]));
		}
	}

	return lines;
}




// int split_main(int argc, char** argv)
// {
// 	// if (argc != 4){
// 	// 	printf("usage: ./a.out split string-to-split chars-to-split-on\n");
// 	// 	return -1;
// 	// }

// 	// char* data = argv[2];
// 	// char* split_chars = argv[3];

// 	string s = read_file("basic.h");
// 	strings lines = split_string(s, "\n");

// 	for (size_t i = 0; i < min(10, lines.length); i++){
// 		printf("%s\n", lines.data[i]);
// 	}

// 	printf("%s", s.data);

// 	return 0;
// }


#endif
