all: generate_alphabet_table generate_binary_testfile

generate_alphabet_table: generate_alphabet_table.c
	$(CC) $< -o $@

generate_binary_testfile: generate_binary_testfile.c
	$(CC) $< -o $@

clean:
	$(RM) generate_alphabet_table generate_binary_testfile
