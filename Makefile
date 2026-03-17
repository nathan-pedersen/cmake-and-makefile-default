.PHONY: debug release run run-release clean

debug:
	@mkdir -p build-debug
	@cd build-debug && cmake .. -DCMAKE_BUILD_TYPE=Debug
	@cd build-debug && make

release:
	@mkdir -p build-release 
	@cd build-release && cmake .. -DCMAKE_BUILD_TYPE=Release
	@cd build-release && make

run: debug
	./build-debug/MyApp

run-release: release
	./build-release/MyApp

gdb: debug
	gdb ./build-debug/MyApp

valgrind: debug
	valgrind ./build-debug/MyApp

clean:
	rm -rf build-debug build-release

