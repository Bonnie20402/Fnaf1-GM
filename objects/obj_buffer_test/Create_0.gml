#region String buffer
example_string = "Hello World!";
example_string_size = string_byte_length(example_string);

my_first_buffer = buffer_create(example_string_size, buffer_fixed, 1);

buffer_write(my_first_buffer, buffer_text, example_string);

// Reset the read position to the start of the buffer
buffer_seek(my_first_buffer, buffer_seek_start, 0);

// Use buffer_string for reading
string_from_buffer = buffer_read(my_first_buffer, buffer_string);
show_message(string_from_buffer);

buffer_delete(my_first_buffer);
#endregion

#region A string,int and float buffer (dynamic)

my_number = 18;
my_second_string = "I like pizza";
my_float = 3.17;
my_dynamic_buffer = buffer_create(0,buffer_grow,1);

buffer_write(my_dynamic_buffer,buffer_s8,my_number);
buffer_write(my_dynamic_buffer,buffer_string,my_second_string);
buffer_write(my_dynamic_buffer,buffer_f16,my_float);

// buffer tell returns many bytes the "seeker/buffer pointer" advanced so we know the total size to compress
my_zipped_buffer = buffer_compress(my_dynamic_buffer,0,buffer_tell(my_dynamic_buffer));
buffer_delete(my_dynamic_buffer);
my_dynamic_buffer = -1;

my_dynamic_buffer = buffer_decompress(my_zipped_buffer);
my_number_b = buffer_read(my_dynamic_buffer,buffer_s8);
my_string_b = buffer_read(my_dynamic_buffer,buffer_string);
my_float = buffer_read(my_dynamic_buffer,buffer_f16);


show_message("Number: " + string(my_number_b)+ "\n String: " + my_second_string + "\nFloat:" + string(my_float));
show_message("Zipped buffer:" + string(buffer_get_size(my_zipped_buffer)) + "Unzipped buffer:" + string(buffer_get_size(my_dynamic_buffer)));

buffer_delete(my_zipped_buffer);
buffer_delete(my_dynamic_buffer);

#endregion
