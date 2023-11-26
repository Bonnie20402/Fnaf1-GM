example_string = "Hello World!";
example_string_size = string_byte_length(example_string);

my_first_buffer = buffer_create(example_string_size, buffer_fixed, 1);

buffer_write(my_first_buffer, buffer_string, example_string);

// Reset the read position to the start of the buffer
buffer_seek(my_first_buffer, buffer_seek_start, 0);

string_from_buffer = buffer_read(my_first_buffer, buffer_string);
show_message(string(string_from_buffer));
buffer_delete(my_first_buffer);

