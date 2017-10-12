all: build doczip
build: myexe
myexe: college.o collegemain.o course.o
	g++ -o myexe college.o collegemain.o course.o
college.o: college.cc college.h 
	g++ -c college.cc
collegemain.o: collegemain.cc course.h node.h college.h
	g++ -c collegemain.cc
course.o: course.cc course.h
	g++ -c course.cc
doc:
	doxygen Doxyfile
	rm -r latex/
doczip: 
	touch doc_files.tar.gz
	tar -czvf doc_files.tar.gz --exclude=doc_files.tar.gz .
clean:
	rm myexe *.o 
